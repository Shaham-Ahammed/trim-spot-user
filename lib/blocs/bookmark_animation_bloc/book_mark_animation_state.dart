part of 'book_mark_animation_bloc.dart';

@immutable
sealed class BookMarkAnimationState {
  final bool isBookmarked;

  const BookMarkAnimationState({required this.isBookmarked});
}

final class BookMarkAnimationInitial extends BookMarkAnimationState {

  const BookMarkAnimationInitial({required super.isBookmarked});
}

final class ShowLoading extends BookMarkAnimationState{
  const ShowLoading({required super.isBookmarked});
  
} 

final class RemovingCompleted extends BookMarkAnimationState{
  const RemovingCompleted({required super.isBookmarked});
}