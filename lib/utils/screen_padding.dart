import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

EdgeInsets commonScreenPadding(BuildContext context) {
  return EdgeInsets.only(
      left: mediaqueryHeight(0.02, context),
      right: mediaqueryHeight(0.02, context),
      top: mediaqueryHeight(0.025, context));
}
