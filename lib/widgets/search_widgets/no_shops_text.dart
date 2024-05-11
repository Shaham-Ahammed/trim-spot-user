import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class NoShopsRegisteredText extends StatelessWidget {
  const NoShopsRegisteredText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: myFont("no shops registered yet",
          fontFamily: balooChettan,
          fontSize: mediaqueryHeight(0.2, context),
          fontWeight: FontWeight.w500,
          fontColor: greyColor),
    );
  }
}