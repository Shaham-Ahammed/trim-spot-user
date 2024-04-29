import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

  bookingsScreenHeading(BuildContext context) {
   return myFont("My Appointments",
        fontFamily: belleza,
        fontSize: mediaqueryHeight(0.028, context),
        fontWeight: FontWeight.normal,
        fontColor: whiteColor);
  }