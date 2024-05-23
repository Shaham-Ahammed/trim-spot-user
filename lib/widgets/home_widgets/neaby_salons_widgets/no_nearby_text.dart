import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class NoNearbySalonsText extends StatelessWidget {
  const NoNearbySalonsText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: mediaqueryHeight(0.07, context)),
      child: Center(
          child: myFont("no nearby salons available\nexplore more in search ",
              textalign: TextAlign.center,
              fontFamily: balooChettan,
              fontSize: mediaqueryHeight(0.018, context),
              fontWeight: FontWeight.w400,
              fontColor: greyColor2)),
    );
  }
}