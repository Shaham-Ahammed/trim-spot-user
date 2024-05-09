import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
class NoReviewsYetText extends StatelessWidget {
  const NoReviewsYetText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: myFont("No reviews yet",
            fontFamily: balooChettan,
            fontSize: mediaqueryHeight(0.02, context),
            fontWeight: FontWeight.w500,
            fontColor: whiteColor),
      ),
    );
  }
}