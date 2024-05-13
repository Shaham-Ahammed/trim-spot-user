import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/reviews_and_ratings/functions/review_time_calculator.dart';

class DisplayReviewsAndRatings extends StatelessWidget {
  final AsyncSnapshot<QuerySnapshot<Object?>> snapshot;
  const DisplayReviewsAndRatings(
    this.snapshot, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: snapshot.data!.docs.length,
        itemBuilder: (context, index) {
          final reviewer = snapshot.data!.docs[index];
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
                    backgroundImage: reviewer[ReviewDocumentModel.imagePath] ==
                            ""
                        ? const AssetImage("assets/images/profile upload.png")
                            as ImageProvider
                        : NetworkImage(reviewer[ReviewDocumentModel.imagePath]),
                    radius: mediaqueryHeight(0.0323, context),
                  ),
                  SizedBox(
                    width: mediaqueryWidth(0.04, context),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      myFont(reviewer[ReviewDocumentModel.userNmae],
                          fontFamily: balooChettan,
                          fontSize: mediaqueryHeight(0.023, context),
                          fontWeight: FontWeight.w500,
                          fontColor: whiteColor),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(5, (index) {
                          if (index <
                              int.parse(
                                  reviewer[ReviewDocumentModel.ratings])) {
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
                  ),
                  const Spacer(),
                  myFont(getTimeAgo(reviewer[ReviewDocumentModel.ratingTime]),
                      fontFamily: balooChettan,
                      fontSize: mediaqueryHeight(0.015, context),
                      fontWeight: FontWeight.w500,
                      fontColor: greyColor)
                ],
              ),
              SizedBox(
                height: mediaqueryHeight(0.02, context),
              ),
              myFont(reviewer[ReviewDocumentModel.review],
                  fontFamily: balooChettan,
                  fontSize: mediaqueryHeight(0.018, context),
                  fontWeight: FontWeight.normal,
                  fontColor: greyColor2),
              SizedBox(
                height: mediaqueryHeight(0.02, context),
              ),
              const Divider(
                thickness: 1,
              )
            ],
          );
        },
      ),
    );
  }
}
