import 'package:intl/intl.dart';
import 'package:trim_spot_user_side/data/data_provider/user_data_document.dart';
import 'package:trim_spot_user_side/data/firebase_collection_references/user_information_reference.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/data/repository/firebase_docs_and_collections.dart';

changingPastPendingsToCompleted() async {
  final collectionReferenceOfBookingHistory = CollectionReferences()
      .userCollectionReference()
      .doc(UserDataDocumentFromFirebase.userId)
      .collection(FirebaseNamesUserSide.bookingHistoryCollectionReference);

  final allBookingPendings = await CollectionReferences()
      .userCollectionReference()
      .doc(UserDataDocumentFromFirebase.userId)
      .collection(FirebaseNamesUserSide.bookingHistoryCollectionReference)
      .where(BookingHisotryUserDocumentModel.currentStatus,
          isEqualTo: BookingHisotryUserDocumentModel.currentStatusPending)
      .get();

  final docs = allBookingPendings.docs;
  for (var doc in docs) {
    final date = doc[BookingHisotryUserDocumentModel.date];
    final dateInDateTimeFormat = convertToDate(date);
    bool dateIsBeforeToday = isBeforeToday(dateInDateTimeFormat);
    if (dateIsBeforeToday) {
    
      await collectionReferenceOfBookingHistory.doc(doc.id).update({
        BookingHisotryUserDocumentModel.currentStatus:
            BookingHisotryUserDocumentModel.currentStatusCompleted
      });
    } else if (isToday(dateInDateTimeFormat)) {
    
      final String timeSlots = doc[BookingHisotryUserDocumentModel.time];
      List<String> timeSlotsInList = timeSlots.split("-");
      String endingTime = timeSlotsInList.last.trim();

      if (isBeforeNow(endingTime)) {
        await collectionReferenceOfBookingHistory.doc(doc.id).update({
          BookingHisotryUserDocumentModel.currentStatus:
              BookingHisotryUserDocumentModel.currentStatusCompleted
        });
      }
    }
  }
}

DateTime convertToDate(String date) {
  return DateFormat("E, d MMM, yyyy").parse(date);
}

bool isBeforeToday(DateTime date) {
  DateTime now = DateTime.now();
  return date.isBefore(DateTime(now.year, now.month, now.day));
}

bool isToday(DateTime date) {
  DateTime now = DateTime.now();
  return date.year == now.year &&
      date.month == now.month &&
      date.day == now.day;
}

bool isBeforeNow(String timeString) {
  // Parse time string into a DateTime object, using today's date
  DateTime time = DateFormat('hh:mm a').parse(timeString);

  // Get current time
  DateTime now = DateTime.now();

  // Combine today's date with the parsed time
  DateTime combinedDateTime = DateTime(
    now.year,
    now.month,
    now.day,
    time.hour,
    time.minute,
  );

  // Compare with current time
  return combinedDateTime.isBefore(now);
}
