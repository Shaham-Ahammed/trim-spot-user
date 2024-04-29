import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class DetailsHeading extends StatelessWidget {
  const DetailsHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: mediaqueryWidth(0.03, context)),
        child: myFont("Details",
            fontFamily: balooChettan,
            fontSize: mediaqueryHeight(0.021, context),
            fontWeight: FontWeight.w600,
            fontColor: greyColor));
  }
}