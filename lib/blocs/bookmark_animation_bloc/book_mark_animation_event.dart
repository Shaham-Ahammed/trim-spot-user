part of 'book_mark_animation_bloc.dart';

@immutable
sealed class BookMarkAnimationEvent {}

final class BookMarkPressed extends BookMarkAnimationEvent {
  final String shopId;
  final BuildContext context;

  BookMarkPressed({required this.shopId, required this.context});
}

final class CheckingShopIsBookmarked extends BookMarkAnimationEvent {
  final String shopId;
  CheckingShopIsBookmarked({required this.shopId});
}

final class InitializeBookMarkLottie extends BookMarkAnimationEvent {}
