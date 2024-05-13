// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/data/data_provider/bookings_to_firebase.dart';

part 'booking_service_event.dart';
part 'booking_service_state.dart';

class BookingCompletionBloc
    extends Bloc<BookingCompletionEvent, BookingCompletionState> {
  BookingCompletionBloc() : super(BookingCompletionInitial()) {
    on<BookNowPressed>(_bookNowPressed);
  }
  _bookNowPressed(
      BookNowPressed event, Emitter<BookingCompletionState> emit) async {
    emit(LoadingIndicatorOnBookingScreen());
    try {
      await BookingsToFirebase()
          .addUserBookingHistoryToFirebase(event.shop, event.context);
      await BookingsToFirebase()
          .addUserBookingToShopside(event.shop, event.context);
      await BookingsToFirebase().lockSlotsOnShopSide(event.shop, event.context);
    } catch (e) {
      emit(BookingFailed());
      return;
    }

    emit(BookingSuccessfullyCompleted());
  
  }
}
