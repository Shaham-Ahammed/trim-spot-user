part of 'slide_to_pay_widget_bloc.dart';

@immutable
sealed class SlideToPayWidgetState {
  final bool notSwiped;

  const SlideToPayWidgetState({required this.notSwiped});
}

final class SlideToPayWidgetInitial extends SlideToPayWidgetState {
  const SlideToPayWidgetInitial({required super.notSwiped});
}
