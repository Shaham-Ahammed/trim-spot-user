import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/submit_button.dart';

submitButtonOtpProfile(BuildContext context) {
  return submitButtonCyan(context, function: () {
    Navigator.pop(context);
    Navigator.pop(context);
    return null;
  },
      heigh: mediaqueryHeight(0.05, context),
      text: "submit",
      fontSize: mediaqueryHeight(0.024, context),
      width: mediaqueryWidth(0.35, context));
}
