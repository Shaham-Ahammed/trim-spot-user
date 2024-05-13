// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:trim_spot_user_side/blocs/rating_stars_bloc/rating_stars_bloc.dart';
import 'package:trim_spot_user_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_user_side/data/firebase_collection_references/user_information_reference.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/data/repository/firebase_docs_and_collections.dart';
import 'package:trim_spot_user_side/models/ratings_model.dart';
import 'package:trim_spot_user_side/utils/rate_and_review/controller.dart';

class ReviewAndRatingsSubmission {
  Future<bool> checkForPreviousReview(
      QueryDocumentSnapshot<Object?> bookingHistory) async {
    final QuerySnapshot<Map<String, dynamic>> reviewDetails =
        await CollectionReferences()
            .shopDetailsReference()
            .doc(bookingHistory[BookingHisotryUserDocumentModel.shopId])
            .collection(FirebaseNamesShopSide.reviewscollectionReference)
            .where(ReviewDocumentModel.serviceDoneOn,
                isEqualTo:bookingHistory[ BookingHisotryUserDocumentModel.date])
            .where(ReviewDocumentModel.timeSlotWasOn,
                isEqualTo:bookingHistory[ BookingsShopSideDocumentModel.time])
            .get();
    print(reviewDetails.docs.length);
    if (reviewDetails.docs.isEmpty) {
      return false;
    }
    return true;
  }

  uploadingUserReviewToShopSide(BuildContext context,
      QueryDocumentSnapshot<Object?> bookingDetails) async {
    final CollectionReference collectionReferenceOfReview =
        CollectionReferences()
            .shopDetailsReference()
            .doc(bookingDetails[BookingHisotryUserDocumentModel.shopId])
            .collection(FirebaseNamesShopSide.reviewscollectionReference);
    final UserDetailsState userDetailsState =
        BlocProvider.of<UserDetailsBloc>(context).state;
    final int starCount = BlocProvider.of<RatingStarsBloc>(context).state.rated;

    final DateTime currentTimeInDateTime = DateTime.now();
    String dateString =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(currentTimeInDateTime);

    final data = ReviewsAndRatingsModel(
            imagepath: userDetailsState.profileImage,
            name: userDetailsState.userName,
            rating: starCount.toString(),
            review: reviewController.text.trim(),
            currentTime: dateString,
            serviceDoneOn: bookingDetails[BookingHisotryUserDocumentModel.date],
            timeSlotWasOn: bookingDetails[BookingHisotryUserDocumentModel.time])
        .toMap();
    try {
      await collectionReferenceOfReview.add(data);
    } catch (e) {
      print("error occured $e");
    }
  }
}
