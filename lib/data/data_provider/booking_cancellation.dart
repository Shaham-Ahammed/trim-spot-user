// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:trim_spot_user_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_user_side/data/firebase_collection_references/user_information_reference.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/data/repository/firebase_docs_and_collections.dart';

class BookingCancellation {
  changePendingToCancelledInUserBookingHistory(BuildContext context,
      QueryDocumentSnapshot<Object?> bookingDetails) async {
    final DocumentReference bookingDetailsReference = CollectionReferences()
        .userCollectionReference()
        .doc(BlocProvider.of<UserDetailsBloc>(context, listen: false).state.id)
        .collection(FirebaseNamesUserSide.bookingHistoryCollectionReference)
        .doc(bookingDetails.id);

    await bookingDetailsReference.update({
      BookingHisotryUserDocumentModel.currentStatus:
          BookingHisotryUserDocumentModel.currentStatusCancelled
    });
  }

  removingPendingFromShopSide(BuildContext context,
      QueryDocumentSnapshot<Object?> bookingDetails) async {
    final String bookedDay =
        bookingDetails[BookingHisotryUserDocumentModel.date];
    final DateTime parsedBookedDay =
        DateFormat('E, d MMM, yyyy').parse(bookedDay);
    
    final String requiredParseModelOfDate =
        DateFormat('dd-MM-yyyy').format(parsedBookedDay);
    print(requiredParseModelOfDate);
    final CollectionReference shopBookingDetailsReference =
        CollectionReferences()
            .shopDetailsReference()
            .doc(bookingDetails[BookingHisotryUserDocumentModel.shopId])
            .collection(FirebaseNamesShopSide.dailyBookingsCollection)
            .doc(requiredParseModelOfDate)
            .collection(FirebaseNamesShopSide.bookingDetailsCollection);
    final QuerySnapshot<Object?> document = await shopBookingDetailsReference
        .where(BookingsShopSideDocumentModel.time,
            isEqualTo: bookingDetails[BookingHisotryUserDocumentModel.time])
        .get();
    print(document.docs.first.id);
    final String deletionDocId = document.docs.first.id;
    final DocumentReference deletionDocumentReference =
        shopBookingDetailsReference.doc(deletionDocId);
    try {
      await deletionDocumentReference.delete();
    } catch (e) {
      print("failure $e");
    }
  }
}
