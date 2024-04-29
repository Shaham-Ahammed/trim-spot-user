import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

heading(BuildContext context) {
  return myFont("Customer support",
      fontFamily: balooChettan,
      fontSize: mediaqueryHeight(0.025, context),
      fontWeight: FontWeight.normal,
      fontColor: greyColor2);
}

customerSupporText() {
  return myFont(
      "You can get in touch with us through below platforms. Our team will reach out to you as soon as possible",
      fontFamily: balooChettan,
      fontSize: 12,
      fontWeight: FontWeight.normal,
      fontColor: subTitlesTextGrey);
}
