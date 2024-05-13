import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/data/data_provider/review_and_ratings.dart';

part 'review_and_rating_event.dart';
part 'review_and_rating_state.dart';

class ReviewAndRatingBloc
    extends Bloc<ReviewAndRatingEvent, ReviewAndRatingState> {
  ReviewAndRatingBloc() : super(ReviewAndRatingInitial()) {
    on<SubmitButtonPressed>(_submitButtonPressed);
    on<RateAndReviewButtonPressed>(_rateAndReviewButtonPressed);
  }

  _rateAndReviewButtonPressed(RateAndReviewButtonPressed event,
      Emitter<ReviewAndRatingState> emit) async {
            emit(LoadingIndicatorReviewScreen());
    final bool isReviewed = await ReviewAndRatingsSubmission()
        .checkForPreviousReview(event.reviewDetails);

    if (isReviewed) {
          emit(DisplayUserAlreadyRatedAlert());
    } else {
 
       emit(ShowRateAndReviewOption());
    }
  }

  _submitButtonPressed(
      SubmitButtonPressed event, Emitter<ReviewAndRatingState> emit) async {
    emit(LoadingIndicatorReviewScreen());

    try {
      await ReviewAndRatingsSubmission()
          .uploadingUserReviewToShopSide(event.context, event.reviewDetails);
    } catch (e) {
      emit(ReviewSubmissionFailed());
      return;
    }
    emit(ReviewSuccessfullySubmitted());
  }
}
