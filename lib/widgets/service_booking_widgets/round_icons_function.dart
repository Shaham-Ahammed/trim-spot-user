 import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

 
 Material roundIconsBookingScreen(BuildContext context,
      {required IconData icon, required Function()? function}) {
    return Material(
      color: blackColor,
      borderRadius: BorderRadius.circular(90),
      child: InkWell(
        borderRadius: BorderRadius.circular(90),
        onTap: function,
        child: Container(
          padding: EdgeInsets.all(mediaqueryHeight(0.02, context)),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: cyanColor, width: 2),
          ),
          child: Icon(
            icon,
            color: whiteColor,
            size: mediaqueryHeight(0.025, context),
          ),
        ),
      ),
    );
  }
