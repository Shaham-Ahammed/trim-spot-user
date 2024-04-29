 import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

  AppBar appBarEditPhone(BuildContext context) {
    return AppBar(
      backgroundColor: appBarColor,
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: mediaqueryHeight(0.03, context),
            color: whiteColor,
          )),
      title: myFont("Edit Phone",
          fontFamily: belleza,
          fontSize: mediaqueryHeight(0.03, context),
          fontWeight: FontWeight.w500,
          fontColor: whiteColor),
    );
  }