import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

  EdgeInsets containerPaddingServiceBooking(BuildContext context) {
    return EdgeInsets.symmetric(
      horizontal: mediaqueryWidth(0.03, context),
    );
  }

  BoxDecoration containerBoxDecoration([Color boxColor = transparentColor]) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: boxColor,
        border: Border.all(color: cyanColor, width: .4));
  }

  serviceBookingScreenHeadings(BuildContext context, String heading) {
    return Column(
      children: [
        myFont(heading,
            fontFamily: belleza,
            fontSize: mediaqueryHeight(0.022, context),
            fontWeight: FontWeight.w500,
            fontColor: greyColor2),
        SizedBox(
          height: mediaqueryHeight(0.008, context),
        ),
      ],
    );
  }