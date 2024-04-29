import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class CloseButtonDrawer extends StatelessWidget {
  const CloseButtonDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.close_rounded,
          size: mediaqueryHeight(0.035, context),
          color: whiteColor,
        ),
      ),
    );
  }
}
