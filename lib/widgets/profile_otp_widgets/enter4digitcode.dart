import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';


 enter4digitcodeText(BuildContext context) {
    return myFont("Enter your 4 digit code",
        fontFamily: balooChettan,
        fontSize: mediaqueryHeight(0.025, context),
        fontWeight: FontWeight.w700,
        fontColor: whiteColor);
  }
