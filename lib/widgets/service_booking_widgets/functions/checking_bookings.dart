import 'package:intl/intl.dart';
import 'package:trim_spot_user_side/data/firebase_collection_references/user_information_reference.dart';
import 'package:trim_spot_user_side/data/repository/firebase_docs_and_collections.dart';

class SlotTileFucntions {
  fetchingBookedSlots(String shopId) async {
    List<String> sixDaysFromNow = [];
    for (int i = 0; i < 6; i++) {
      String date = DateFormat('dd-MM-yyyy')
          .format(DateTime.now().add(Duration(days: i)));
      sixDaysFromNow.add(date);
    }

    final bookedSlotsReference = CollectionReferences()
        .shopDetailsReference()
        .doc(shopId)
        .collection(FirebaseNamesShopSide.bookingCollectionReference)
        .doc(FirebaseNamesShopSide.slotsBookingDocument);
    final bookedSlotsCollection = await bookedSlotsReference.get();
    for (var dates in sixDaysFromNow) {
      if (!bookedSlotsCollection.data()!.containsKey(dates)) {
        await bookedSlotsReference.update(
          {dates: []},
        );
      }
    }
  }
}
