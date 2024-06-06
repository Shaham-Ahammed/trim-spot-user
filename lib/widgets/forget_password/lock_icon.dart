import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class LockIcon extends StatelessWidget {
  const LockIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.lock_open,
      color: whiteColor,
      size: mediaqueryHeight(0.07, context),
    );
  }
}

