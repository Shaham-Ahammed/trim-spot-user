// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:trim_spot_user_side/data/data_provider/booking_cancellation.dart';

import 'package:trim_spot_user_side/data/repository/document_model.dart';

part 'cancel_booking_bloc_event.dart';
part 'cancel_booking_bloc_state.dart';

class CancelBookingBloc
    extends Bloc<CancelBookingBlocEvent, CancelBookingBlocState> {
  CancelBookingBloc() : super(CancelBookingBlocInitial()) {
    on<CancelBookingPressed>(_cancelBookingPressed);
    on<PressedYesOnCancelBooking>(_pressedYesOnCancelBooking);
  }
  _cancelBookingPressed(
      CancelBookingPressed event, Emitter<CancelBookingBlocState> emit) {
    final dateOfBooking =
        event.bookingDetails[BookingHisotryUserDocumentModel.date];
    final String today = DateFormat('E, d MMM, yyyy').format(DateTime.now());
    if (today == dateOfBooking) {
      emit(ShowCannotCancelAlert());
    } else {
      emit(ShowCancellationAlertDialogue());
    }
  }

  _pressedYesOnCancelBooking(PressedYesOnCancelBooking event,
      Emitter<CancelBookingBlocState> emit) async {
    emit(LoadingCancellation());
    try {
      await BookingCancellation().changePendingToCancelledInUserBookingHistory(
          event.context, event.bookingDetails);
      await BookingCancellation()
          .removingPendingFromShopSide(event.context, event.bookingDetails);
      await BookingCancellation().removeTheBookedSlotsFromShopside(
          event.context, event.bookingDetails);
    } catch (e) {
      emit(CancellationFailed());
      return;
    }

    emit(CancellationCompleted());
  }
}
