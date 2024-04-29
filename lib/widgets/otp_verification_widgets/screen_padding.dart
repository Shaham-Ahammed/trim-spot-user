  import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
  
  EdgeInsets screenPadding(BuildContext context) {
    return EdgeInsets.only(
        left: mediaqueryHeight(0.04, context),
        right: mediaqueryHeight(0.04, context),
        top: mediaqueryHeight(0.04, context),
        bottom: MediaQuery.of(context).viewInsets.bottom);
  }

