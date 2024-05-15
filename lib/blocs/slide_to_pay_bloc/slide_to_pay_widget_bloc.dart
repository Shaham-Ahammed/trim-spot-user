import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'slide_to_pay_widget_event.dart';
part 'slide_to_pay_widget_state.dart';

class SlideToPayWidgetBloc
    extends Bloc<SlideToPayWidgetEvent, SlideToPayWidgetState> {
  SlideToPayWidgetBloc() : super(SlideToPayWidgetInitial(notSwiped: true)) {
    on<SwipedThePayment>(_swipedThePayment);
  }
  _swipedThePayment(
      SwipedThePayment event, Emitter<SlideToPayWidgetState> emit) async {
    emit(SlideToPayWidgetInitial(notSwiped: false));
    await Future.delayed(const Duration(seconds: 1));
    emit(SlideToPayWidgetInitial(notSwiped: true));
  }
}
