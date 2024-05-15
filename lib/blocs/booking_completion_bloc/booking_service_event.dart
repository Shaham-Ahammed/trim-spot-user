part of 'booking_service_bloc.dart';

@immutable
sealed class BookingCompletionEvent {}

final class BookNowPressed extends BookingCompletionEvent {
  final QueryDocumentSnapshot<Object?> shop;
  final BuildContext context;

  BookNowPressed({required this.shop, required this.context});
}

final class WalletSelectedForPayment extends BookingCompletionEvent {
  final QueryDocumentSnapshot<Object?> shop;
  final BuildContext context;
  final int totalAmount;
  WalletSelectedForPayment({required this.shop, required this.context,required this.totalAmount});
}
