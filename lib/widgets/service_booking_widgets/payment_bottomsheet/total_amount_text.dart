import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

amountPayableText(int amount, BuildContext context) {
  myFont("PAY ₹$amount",
                  fontFamily: b612,
                  fontSize: mediaqueryHeight(0.023, context),
                  fontWeight: FontWeight.w500,
                  fontColor: whiteColor);
}
