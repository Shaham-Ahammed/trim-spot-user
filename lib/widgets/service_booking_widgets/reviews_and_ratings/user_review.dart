import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/data/firebase_collection_references/user_information_reference.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/data/repository/firebase_docs_and_collections.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/reviews_and_ratings/no_reviews_yet.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/reviews_and_ratings/review_list.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/reviews_and_ratings/shimmer_effect.dart';

class UserReviews extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> shop;
  const UserReviews(
    this.shop, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: CollectionReferences()
            .shopDetailsReference()
            .doc(shop.id)
            .collection(FirebaseNamesShopSide.reviewscollectionReference)
            .orderBy(ReviewDocumentModel.timeStamp,descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const ShimmerEffectForReviewInBookingScreen();
          }

          if (snapshot.data!.docs.isEmpty) {
            return const NoReviewsYetText();
          }
          if (snapshot.data!.docs.isNotEmpty) {
            return reviewList(snapshot);
          }
          return Container();
        });
  }
}
