import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
 captionText() {
   return myFont("please check your phone sms",
        fontFamily: balooChettan,
        fontSize: 13,
        fontWeight: FontWeight.w500,
        fontColor: whiteColor);
  }

  fourDigitCodeHeading(BuildContext context) {
   return myFont("Enter your 6 digit code",
        fontFamily: balooChettan,
        fontSize: mediaqueryHeight(0.032, context),
        fontWeight: FontWeight.w700,
        fontColor: whiteColor);
  }

  otpVerficationHeading(BuildContext context) {
   return myFont("OTP Verification",
        fontFamily: cabinCondensed,
        fontSize: mediaqueryHeight(0.04, context),
        fontWeight: FontWeight.w600,
        fontColor: whiteColor);
  }
