import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/data/firebase_collection_references/user_information_reference.dart';
import 'package:trim_spot_user_side/data/repository/firebase_docs_and_collections.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/widgets/reviews_and_ratings/appbar.dart';
import 'package:trim_spot_user_side/widgets/reviews_and_ratings/listview_reviews.dart';
import 'package:trim_spot_user_side/widgets/reviews_and_ratings/subheading.dart';

import 'package:trim_spot_user_side/widgets/reviews_and_ratings/ratings_shimmer_effect.dart';

class ReviewsAndRatingsScreen extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> shop;
  const ReviewsAndRatingsScreen({super.key, required this.shop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blackColor,
        appBar: reviewsAndRatingsAppBar(context, shop),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(mediaqueryHeight(0.02, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              reviesAndRatingsSubCaption(context),
              SizedBox(
                height: mediaqueryHeight(0.025, context),
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: CollectionReferences()
                      .salonCollectionReference()
                      .doc(shop.id)
                      .collection(
                          FirebaseNamesShopSide.reviewscollectionReference)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Expanded(child: ShimmerOfReviewsLoading(count: 4));
                    }

                    return DisplayReviewsAndRatings(snapshot);
                  }),
            ],
          ),
        )));
  }
}
