import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:lottie/lottie.dart';

class NoBookingsAnimationLottieAndText extends StatelessWidget {
  const NoBookingsAnimationLottieAndText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LottieBuilder.asset(
          "assets/animations/nobooking.json",
          height: mediaqueryHeight(0.25, context),
        ),
        myFont(
            "        No bookings scheduled yet.\n Book your first appointment now !!",
            fontFamily: balooChettan,
            fontSize: mediaqueryHeight(0.015, context),
            fontWeight: FontWeight.w500,
            fontColor: whiteColor)
      ],
    ));
  }
}