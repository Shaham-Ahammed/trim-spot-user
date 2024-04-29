import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:slide_to_act_reborn/slide_to_act_reborn.dart';

import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class SlideToPayWidget extends StatelessWidget {
  const SlideToPayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: mediaqueryHeight(0.02, context),
        ),
        SlideAction(
          borderRadius: 90,
          height: mediaqueryHeight(0.082, context),
          innerColor: cyanColor,
          outerColor: Colors.white30,
          sliderButtonIcon: const Icon(
            Icons.attach_money,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: mediaqueryWidth(0.16, context),
              ),
              myFont("proceed to payment",
                  fontFamily: balooChettan,
                  fontSize: mediaqueryHeight(0.023, context),
                  fontWeight: FontWeight.normal,
                  fontColor: whiteColor),
              LottieBuilder.asset(
                "assets/animations/swipe_to_pay_animation.json",
                height: mediaqueryHeight(0.034, context),
              )
            ],
          ),
        ),
      ],
    );
  }
}
