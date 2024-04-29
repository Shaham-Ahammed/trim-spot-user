part of 'rating_stars_bloc.dart';

@immutable
sealed class RatingStarsState {
  final int rated;

  const RatingStarsState({required this.rated});
}

final class RatingStarsInitial extends RatingStarsState {
  const RatingStarsInitial({required super.rated});
}
