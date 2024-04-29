import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/utils/service_booking/animation_controller.dart';

part 'book_mark_animation_event.dart';
part 'book_mark_animation_state.dart';

class BookMarkAnimationBloc
    extends Bloc<BookMarkAnimationEvent, BookMarkAnimationState> {
  BookMarkAnimationBloc()
      : super(const BookMarkAnimationInitial(isBookmarked: false)) {
    on<BookMarkPressed>(_bookMarkPressed);
  }
  _bookMarkPressed(
      BookMarkPressed event, Emitter<BookMarkAnimationState> emit) async{
    state.isBookmarked
        ?await bookmarkAnimationController.reverse().whenComplete(
              () => emit(
                const BookMarkAnimationInitial(isBookmarked: false),
              ),
            )
        :await bookmarkAnimationController.forward().whenComplete(
            () => emit(const BookMarkAnimationInitial(isBookmarked: true)));
  }
}
