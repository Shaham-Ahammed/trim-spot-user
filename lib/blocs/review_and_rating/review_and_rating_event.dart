part of 'review_and_rating_bloc.dart';

@immutable
sealed class ReviewAndRatingEvent {}

final class SubmitButtonPressed extends ReviewAndRatingEvent {
  final BuildContext context;
  final QueryDocumentSnapshot<Object?> reviewDetails;

  SubmitButtonPressed({required this.context, required this.reviewDetails});
}

final class RateAndReviewButtonPressed extends ReviewAndRatingEvent {
  final QueryDocumentSnapshot<Object?> reviewDetails;

  RateAndReviewButtonPressed({required this.reviewDetails});
}
