// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/data/data_provider/bookings_to_firebase.dart';
import 'package:trim_spot_user_side/data/data_provider/updating_wallet.dart';
import 'package:trim_spot_user_side/widgets/drawer_home/functions/fetching_waller_amount.dart';

part 'booking_service_event.dart';
part 'booking_service_state.dart';

class BookingCompletionBloc
    extends Bloc<BookingCompletionEvent, BookingCompletionState> {
  BookingCompletionBloc() : super(BookingCompletionInitial()) {
    on<BookNowPressed>(_bookNowPressed);
    on<WalletSelectedForPayment>(_walletSelectedForPayment);
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
      print(e);
      emit(BookingFailed());
      return;
    }

    emit(BookingSuccessfullyCompleted());
  }

  _walletSelectedForPayment(WalletSelectedForPayment event,
      Emitter<BookingCompletionState> emit) async {
    emit(LoadingIndicatorOnBookingScreen());

    final walletAmount = await fetchingTheWalletAmount(event.context);
    bool isThereEnoughBalance = int.parse(walletAmount) >= event.totalAmount;
    if (!isThereEnoughBalance) {
      emit(NoEnoughAmountOnWallet());
    } else {
      try {
        emit(StopLoading());
        add(BookNowPressed(shop: event.shop, context: event.context));
        await DbWalletOperations().amountDeductionAndWalletUpdation(
            event.shop, event.context, event.totalAmount);
      } catch (e) {
        print(e);
        emit(BookingFailed());
      }
    }
  }
}
