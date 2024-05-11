part of 'booking_service_bloc.dart';

@immutable
sealed class BookingCompletionEvent {}

final class BookNowPressed extends BookingCompletionEvent {
  final QueryDocumentSnapshot<Object?> shop;
  final BuildContext context;

  BookNowPressed({required this.shop, required this.context});
}
