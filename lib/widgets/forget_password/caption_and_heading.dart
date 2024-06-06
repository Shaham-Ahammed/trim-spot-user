import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
  
  descriptionFont(BuildContext context) {
    return myFont(
        "Provide your account's email for which you want to reset your password",
        fontFamily: balooChettan,
        fontSize: mediaqueryHeight(0.02, context),
        fontWeight: FontWeight.w400,
        fontColor: greyColor3,
        textalign: TextAlign.center);
  }

  forgetPasswordFont(BuildContext context) {
    return myFont("FORGET\nPASSWORD",
        fontFamily: belleza,
        fontSize: mediaqueryHeight(0.035, context),
        fontWeight: FontWeight.w600,
        fontColor: whiteColor,
        textalign: TextAlign.center);
  }