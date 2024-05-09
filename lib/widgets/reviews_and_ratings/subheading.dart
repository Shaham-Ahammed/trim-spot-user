import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

  reviesAndRatingsSubCaption(BuildContext context) {
   return myFont(
      "Reviews & Ratings",
      fontFamily: balooChettan,
      fontSize: mediaqueryHeight(0.02, context),
      fontWeight: FontWeight.w500,
      fontColor: greyColor,
    );
  }