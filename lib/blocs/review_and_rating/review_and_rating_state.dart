part of 'review_and_rating_bloc.dart';

@immutable
sealed class ReviewAndRatingState {}

final class ReviewAndRatingInitial extends ReviewAndRatingState {}

final class ReviewSuccessfullySubmitted extends ReviewAndRatingState {}

final class ReviewSubmissionFailed extends ReviewAndRatingState {}

final class LoadingIndicatorReviewScreen extends ReviewAndRatingState {}

final class ShowRateAndReviewOption extends ReviewAndRatingState {}

final class DisplayUserAlreadyRatedAlert extends ReviewAndRatingState {}
