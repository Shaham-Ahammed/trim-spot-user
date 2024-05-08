import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/headings.dart';

Row changePasswordText(BuildContext context) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      profilePageHeadings(context, "Change Password   "),
      Icon(
        Icons.lock_outlined,
        color: greyColor3,
        size: mediaqueryHeight(0.026, context),
      )
    ],
  );
}
