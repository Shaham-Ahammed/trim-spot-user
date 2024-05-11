// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:trim_spot_user_side/blocs/service_booking_blocs/date_selection_bloc/date_selection_bloc.dart';
import 'package:trim_spot_user_side/blocs/service_booking_blocs/service_selected_bloc/service_selected_bloc.dart';
import 'package:trim_spot_user_side/blocs/slot_selection_bloc/slot_selection_bloc.dart';
import 'package:trim_spot_user_side/data/data_provider/user_data_document.dart';
import 'package:trim_spot_user_side/data/firebase_collection_references/user_information_reference.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/data/repository/firebase_docs_and_collections.dart';
import 'package:trim_spot_user_side/models/booking_model.dart';
import 'package:trim_spot_user_side/models/salon_side_booking_model.dart';
import 'package:trim_spot_user_side/utils/service_booking/total_time.dart';

class BookingsToFirebase {
  addUserBookingHistoryToFirebase(
      final QueryDocumentSnapshot<Object?> shop, BuildContext context) async {
    final servicesSelected =
        BlocProvider.of<ServiceSelectedBloc>(context, listen: false)
            .state
            .serviceMap;
    List<String> services = [];
    servicesSelected.forEach((key, value) {
      services.add(key);
    });
    DateTime date =
        BlocProvider.of<DateSelectionBloc>(context, listen: false).state.date!;
    String formattedDate = DateFormat('E, d MMM, y').format(date);

    final allSlots = BlocProvider.of<SlotSelectionBloc>(context, listen: false)
        .state
        .selectedSlots;

    final String lastTime = allSlots.last;
    DateTime lastDateTime = DateFormat('hh:mm a').parse(lastTime);
    lastDateTime = lastDateTime.add(const Duration(minutes: 30));
    String updatedLastTime = DateFormat('hh:mm a').format(lastDateTime);
    final parsedTime = "${allSlots.first} - $updatedLastTime";

    final userDetails = await UserDataDocumentFromFirebase().userDocument();
    final userId = userDetails.id;

    final CollectionReference userBookinHistoryCollectionReference =
        CollectionReferences().userCollectionReference().doc(userId).collection(
            FirebaseNamesUserSide.bookingHistoryCollectionReference);

    for (int i = 0; i < services.length; i++) {
      final data = BookingHistoryModel(
              currentStatus:
                  BookingHisotryUserDocumentModel.currentStatusPending,
              date: formattedDate,
              service: services[i],
              shopLocation: shop[SalonDocumentModel.locationName],
              shopName: shop[SalonDocumentModel.shopName],
              time: parsedTime)
          .toMap();
      try {
        await userBookinHistoryCollectionReference.add(data);
      } catch (e) {
        print("error while addingto user history $e");
      }
    }
  }

  addUserBookingToShopside(
      final QueryDocumentSnapshot<Object?> shop, BuildContext context) async {
    final userDetails = await UserDataDocumentFromFirebase().userDocument();
    final name = userDetails[UserDocumentModel.username];
    final servicesSelected =
        BlocProvider.of<ServiceSelectedBloc>(context, listen: false)
            .state
            .serviceMap;
    List<String> services = [];
    servicesSelected.forEach((key, value) {
      services.add(key);
    });
    String serviesInStringFormat = services.join(', ');
    final totalAmount = totalTimeRequired(context);
    final allSlots = BlocProvider.of<SlotSelectionBloc>(context, listen: false)
        .state
        .selectedSlots;

    final String lastTime = allSlots.last;
    DateTime lastDateTime = DateFormat('hh:mm a').parse(lastTime);
    lastDateTime = lastDateTime.add(const Duration(minutes: 30));
    String updatedLastTime = DateFormat('hh:mm a').format(lastDateTime);
    final parsedTime = "${allSlots.first} - $updatedLastTime";
    DateTime date =
        BlocProvider.of<DateSelectionBloc>(context, listen: false).state.date!;
    final formattedDate = DateFormat('dd-MM-yyyy').format(date);
    final CollectionReference shopBookingHistoryCollection =
        CollectionReferences()
            .shopDetailsReference()
            .doc(shop.id)
            .collection(FirebaseNamesShopSide.dailyBookingsCollection)
            .doc(formattedDate)
            .collection(FirebaseNamesShopSide.bookingDetailsCollection);

    final data = SalonSideBookingModel(
            name: name,
            services: serviesInStringFormat,
            time: parsedTime,
            totalAmount: totalAmount)
        .toMap();
    try {
      await shopBookingHistoryCollection.add(data);
    } catch (e) {
      print("error while adding in shop side");
    }
  }

  lockSlotsOnShopSide(
      final QueryDocumentSnapshot<Object?> shop, BuildContext context) async {
    DateTime date =
        BlocProvider.of<DateSelectionBloc>(context, listen: false).state.date!;
    final String formattedDate = DateFormat('dd-MM-yyyy').format(date);
    final allSlots = BlocProvider.of<SlotSelectionBloc>(context, listen: false)
        .state
        .selectedSlots;
    final docReference = CollectionReferences()
        .shopDetailsReference()
        .doc(shop.id)
        .collection(FirebaseNamesShopSide.bookingCollectionReference)
        .doc(FirebaseNamesShopSide.slotsBookingDocument);
    final bookingData = await docReference.get();
    final List<String> currentBookingsOnTheDate =
        (bookingData[formattedDate] as List<dynamic>).cast<String>();
    final updationData = [...currentBookingsOnTheDate, ...allSlots];
    await docReference.update({formattedDate: updationData});
  }
}
