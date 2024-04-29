import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/models/bookings_model.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class TimeAndDateBookings extends StatelessWidget {
  const TimeAndDateBookings({
    super.key,
    required this.myBookings,
  });

  final BookingsModel myBookings;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        myFont("${myBookings.date}  ",
            fontFamily: balooChettan,
            fontSize: mediaqueryHeight(0.015, context),
            fontWeight: FontWeight.w500,
            fontColor: whiteColor),
        Container(
          width: 1,
          height: mediaqueryHeight(0.011, context),
          color: whiteColor,
        ),
        myFont("  ${myBookings.time}",
            fontFamily: balooChettan,
            fontSize: mediaqueryHeight(0.015, context),
            fontWeight: FontWeight.w500,
            fontColor: whiteColor),
      ],
    );
  }
}
