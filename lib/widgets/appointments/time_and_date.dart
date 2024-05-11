import 'package:flutter/material.dart';

import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class TimeAndDateBookings extends StatelessWidget {
  const TimeAndDateBookings({
    super.key,
    required this.date,
  });

  final String date;

  @override
  Widget build(BuildContext context) {
    return myFont(date,
        fontFamily: balooChettan,
        fontSize: mediaqueryHeight(0.015, context),
        fontWeight: FontWeight.w500,
        fontColor: whiteColor);
  }
}
