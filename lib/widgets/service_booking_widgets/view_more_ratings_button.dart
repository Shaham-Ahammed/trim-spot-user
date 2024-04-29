import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/screens/reviews_and_ratings.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/page%20transitions/slide_transition.dart';


class ViewMoreRatingsButton extends StatelessWidget {
  const ViewMoreRatingsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(SlideTransitionPageRoute(
            child: const ReviewsAndRatingsScreen(),
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
}