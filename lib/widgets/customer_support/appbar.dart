 
import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

  AppBar appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: whiteColor,
            size: mediaqueryHeight(0.025, context),
          )),
      backgroundColor: appBarColor,
      title: myFont("Contact Us",
          fontFamily: belleza,
          fontSize: mediaqueryHeight(0.03, context),
          fontWeight: FontWeight.normal,
          fontColor: whiteColor),
    );
  }