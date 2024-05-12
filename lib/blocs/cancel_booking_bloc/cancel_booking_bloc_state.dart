part of 'cancel_booking_bloc_bloc.dart';

@immutable
sealed class CancelBookingBlocState {}

final class CancelBookingBlocInitial extends CancelBookingBlocState {}

final class ShowCannotCancelAlert extends CancelBookingBlocState{}

final class ShowCancellationAlertDialogue extends CancelBookingBlocState{}

final class LoadingCancellation extends CancelBookingBlocState{}

final class CancellationCompleted extends CancelBookingBlocState{}

final class CancellationFailed extends CancelBookingBlocState{}


