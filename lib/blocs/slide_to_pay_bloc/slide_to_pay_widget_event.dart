part of 'slide_to_pay_widget_bloc.dart';

@immutable
sealed class SlideToPayWidgetEvent {}

final class SwipedThePayment extends SlideToPayWidgetEvent{}