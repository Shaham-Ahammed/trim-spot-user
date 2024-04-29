import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/reviews_and_ratings/modal_list.dart';

class UserReviews extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> shop;
  const UserReviews(
    this.shop, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (shop[SalonDocumentModel.reviewsAndRatings].isEmpty) {
      return Center(
        child: myFont("No ratings yet",
            fontFamily: balooChettan,
            fontSize: mediaqueryHeight(0.023, context),
            fontWeight: FontWeight.w500,
            fontColor: greyColor2),
      );
    } else {
      return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: shop[SalonDocumentModel.reviewsAndRatings].length >= 2 ? 2 : reviewList.length,
          itemBuilder: (context, index) {
            final reviewer = reviewList[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (index != 0)
                  SizedBox(
                    height: mediaqueryHeight(0.02, context),
                  ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(reviewer.imagepath),
                      radius: 23,
                    ),
                    SizedBox(
                      width: mediaqueryWidth(0.04, context),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        myFont(reviewer.name,
                            fontFamily: balooChettan,
                            fontSize: mediaqueryHeight(0.023, context),
                            fontWeight: FontWeight.w500,
                            fontColor: whiteColor),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(5, (index) {
                            if (index < reviewer.rating) {
                              return Icon(
                                Icons.star_rate_rounded,
                                color: Colors.yellow,
                                size: mediaqueryHeight(0.023, context),
                              );
                            } else {
                              return Icon(Icons.star_rate_rounded,
                                  color: Colors.grey,
                                  size: mediaqueryHeight(0.023, context));
                            }
                          }),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: mediaqueryHeight(0.02, context),
                ),
                myFont(reviewer.review,
                    fontFamily: balooChettan,
                    fontSize: mediaqueryHeight(0.018, context),
                    fontWeight: FontWeight.normal,
                    fontColor: greyColor),
                SizedBox(
                  height: mediaqueryHeight(0.006, context),
                ),
              ],
            );
          });
    }
  }
}
