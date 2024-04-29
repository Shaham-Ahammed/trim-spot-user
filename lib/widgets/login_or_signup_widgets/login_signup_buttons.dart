
import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

loginPageButtons(
    {required context,
    required double left,
    required String text,
    required Color textColor,
    required Color containerColor,
    required Color borderColor,
    required Function() function}) {
  return Positioned(
    bottom: mediaqueryHeight(0.07, context),
    left: mediaqueryWidth(left, context),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(90),
        onTap: function,
        child: Container(
          width: mediaqueryWidth(0.42, context),
          height: mediaqueryHeight(0.07, context),
          decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(90),
              border: Border.all(color: borderColor)),
          child: Center(
            child: myFont(text,
                fontFamily: cabinCondensed,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                textalign: TextAlign.center,
                fontColor: textColor),
          ),
        ),
      ),
    ),
  );
}
