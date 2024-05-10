import 'package:intl/intl.dart';
import 'package:trim_spot_user_side/data/firebase_collection_references/user_information_reference.dart';
import 'package:trim_spot_user_side/data/repository/firebase_docs_and_collections.dart';

class SlotTileFucntions {
  fetchingBookedSlots(String shopId) async {
    String date = DateFormat('dd-MM-yyyy').format(DateTime.now());
    final bookedSlotsReference = CollectionReferences()
        .shopDetailsReference()
        .doc(shopId)
        .collection(FirebaseNamesShopSide.bookingCollectionReference)
        .doc(FirebaseNamesShopSide.slotsBookingDocument);
    final bookedSlotsCollection = await bookedSlotsReference.get();

    if (!bookedSlotsCollection.data()!.containsKey(date)) {
      await bookedSlotsReference.update(
        {date: []},
      );
    }
  }
}
