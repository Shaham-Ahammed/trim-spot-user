part of 'rating_stars_bloc.dart';

@immutable
sealed class RatingStarsEvent {}

final class OnRated extends RatingStarsEvent {
  final int count;

  OnRated({required this.count});
}
