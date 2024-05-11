import 'package:flutter/material.dart';

import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class ShopDetails extends StatelessWidget {
  const ShopDetails({
    super.key,
 required this.shopLocation,
 required this.shopName
  });

  final String shopName;
  final String shopLocation;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        myFont("$shopName, ",
            fontFamily: balooChettan,
            fontSize: mediaqueryHeight(0.015, context),
            fontWeight: FontWeight.w400,
            fontColor: greyColor),
        myFont(shopLocation,
            fontFamily: balooChettan,
            fontSize: mediaqueryHeight(0.015, context),
            fontWeight: FontWeight.w400,
            fontColor: greyColor),
      ],
    );
  }
}
