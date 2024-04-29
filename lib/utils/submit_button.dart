import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/cyan_container.dart';
import 'package:trim_spot_user_side/utils/font.dart';

submitButtonCyan(context,
    {required String text,
    required double heigh,
    required double width,
    Color fontColor = blackColor,
    double fontSize = 20,
    required Function? Function() function,
    Color inkwellColor = transparentColor,
    Color buttonColor = cyanColor}) {
  return Material(
      color: buttonColor,
      borderRadius: BorderRadius.circular(90),
      child: InkWell(
        onTap: () {
          function();
        },
        borderRadius: BorderRadius.circular(90),
        child: Container(
          width: width,
          height: heigh,
          decoration: cyanContainer(inkwellColor),
          child: Center(
            child: myFont(text,
                fontFamily: balooChettan,
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                fontColor: fontColor),
          ),
        ),
      ));
}
