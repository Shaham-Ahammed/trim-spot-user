import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

Flushbar<dynamic> loginSuccessSnackBar(BuildContext context) {
  return Flushbar(
    flushbarStyle: FlushbarStyle.FLOATING,
    backgroundColor: Colors.blueGrey,
    borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
    maxWidth: mediaqueryWidth(0.95, context),
    flushbarPosition: FlushbarPosition.TOP,
    message: " ",
    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    padding: EdgeInsets.only(
        left: mediaqueryWidth(0.2, context),
        top: mediaqueryHeight(0.02, context)),
    titleText: Row(children: [
      const Icon(
        Icons.done_all,
        color: whiteColor,
      ),
      SizedBox(
        width: mediaqueryWidth(0.03, context),
      ),
      myFont("Login Success",
          fontFamily: b612,
          fontSize: mediaqueryHeight(0.023, context),
          fontWeight: FontWeight.w600,
          fontColor: whiteColor),
    ]),
    titleColor: whiteColor,
    duration: const Duration(seconds: 3),
  );
}
