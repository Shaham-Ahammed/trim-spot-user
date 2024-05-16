import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/data/firebase_collection_references/user_information_reference.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/data/repository/firebase_docs_and_collections.dart';
import 'package:trim_spot_user_side/screens/reviews_and_ratings.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/page%20transitions/slide_transition.dart';

class ViewMoreRatingsButton extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> shop;
  const ViewMoreRatingsButton({
    super.key,
    required this.shop,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: CollectionReferences()
            .shopDetailsReference()
            .doc(shop.id)
            .collection(FirebaseNamesShopSide.reviewscollectionReference)
            .orderBy(ReviewDocumentModel.timeStamp, descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          }
          if (snapshot.data!.docs.isEmpty) {
            return Container();
          }
          if (snapshot.data!.docs.length > 2) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(SlideTransitionPageRoute(
                    child: ReviewsAndRatingsScreen(shop: shop),
                    direction: AxisDirection.up));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: mediaqueryHeight(0.04, context),
                  ),
                  myFont("view more",
                      fontFamily: balooChettan,
                      fontSize: mediaqueryHeight(0.018, context),
                      fontWeight: FontWeight.normal,
                      fontColor: greyColor2),
                  Icon(
                    Icons.arrow_drop_down_outlined,
                    color: greyColor2,
                    size: mediaqueryHeight(0.023, context),
                  )
                ],
              ),
            );
          }
          return Container();
        });
  }
}
