part of 'slide_to_pay_widget_bloc.dart';

@immutable
sealed class SlideToPayWidgetState {
  final bool notSwiped;

  SlideToPayWidgetState({required this.notSwiped});
}

final class SlideToPayWidgetInitial extends SlideToPayWidgetState {
  SlideToPayWidgetInitial({required super.notSwiped});
}
