// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/data/data_provider/bookmark_animation.dart';
import 'package:trim_spot_user_side/utils/service_booking/animation_controller.dart';

part 'book_mark_animation_event.dart';
part 'book_mark_animation_state.dart';

class BookMarkAnimationBloc
    extends Bloc<BookMarkAnimationEvent, BookMarkAnimationState> {
  BookMarkAnimationBloc()
      : super(const BookMarkAnimationInitial(isBookmarked: false)) {
    on<BookMarkPressed>(_bookMarkPressed);
    on<CheckingShopIsBookmarked>(_checkingShopIsBookmarked);
    on<InitializeBookMarkLottie>(_initializeBookMarkLottie);
  }
  _bookMarkPressed(
      BookMarkPressed event, Emitter<BookMarkAnimationState> emit) async {
    if (state.isBookmarked) {
      await bookmarkAnimationController.reverse().whenComplete(
            () => emit(
              const BookMarkAnimationInitial(isBookmarked: false),
            ),
          );

      await BookMarkFucntions()
          .removeShopFromBookMarked(event.shopId, event.context);

      emit(const BookMarkAnimationInitial(
          isBookmarked: true)); //changing the state just to update the widget
    } else {
      await bookmarkAnimationController.forward().whenComplete(
          () => emit(const BookMarkAnimationInitial(isBookmarked: true)));
      await BookMarkFucntions()
          .addShopToBookmarkedList(event.shopId, event.context);
    }
  }

  _checkingShopIsBookmarked(CheckingShopIsBookmarked event,
      Emitter<BookMarkAnimationState> emit) async {
    final shopIsBookmarked =
        await BookMarkFucntions().checkingShopIsBookmarked(event.shopId);
    if (shopIsBookmarked) {
      emit(const BookMarkAnimationInitial(isBookmarked: true));
      add(InitializeBookMarkLottie());
    } else {
      emit(const BookMarkAnimationInitial(isBookmarked: false));
    }
  }

  _initializeBookMarkLottie(InitializeBookMarkLottie event,
      Emitter<BookMarkAnimationState> emit) async {
    if (state.isBookmarked) {
      await bookmarkAnimationController.forward();
    }
  }
}
