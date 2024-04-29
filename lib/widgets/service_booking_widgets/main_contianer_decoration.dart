import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

  EdgeInsets bigContainerPadding(BuildContext context) {
    return EdgeInsets.only(
        top: mediaqueryHeight(0.05, context),
        left: mediaqueryWidth(0.03, context),
        right: mediaqueryWidth(0.03, context),
        bottom: mediaqueryHeight(0.01, context));
  }

  BoxDecoration bigContainerDecoration() {
    return BoxDecoration(
        color: const Color.fromARGB(179, 60, 60, 60),
        border: Border.all(color: cyanColor),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(35),
        ));
  }