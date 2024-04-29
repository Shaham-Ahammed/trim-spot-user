import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

  caption(BuildContext context) {
  return  myFont("This mobile number will be verified by an OTP",
                fontFamily: balooChettan,
                fontSize: mediaqueryHeight(0.015, context),
                fontWeight: FontWeight.normal,
                fontColor: greyColor);
  }

