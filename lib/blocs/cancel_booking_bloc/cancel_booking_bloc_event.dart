part of 'cancel_booking_bloc_bloc.dart';

@immutable
sealed class CancelBookingBlocEvent {}

final class CancelBookingPressed extends CancelBookingBlocEvent {
  final QueryDocumentSnapshot<Object?> bookingDetails;

  CancelBookingPressed({required this.bookingDetails});
}

final class PressedYesOnCancelBooking extends CancelBookingBlocEvent {
  final QueryDocumentSnapshot<Object?> bookingDetails;
  final BuildContext context;
  PressedYesOnCancelBooking({required this.bookingDetails,required this.context});
}
