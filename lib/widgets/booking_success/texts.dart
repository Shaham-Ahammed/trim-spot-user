
import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class BookingSuccessText extends StatelessWidget {
  const BookingSuccessText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        myFont("Booking ",
            fontFamily: b612,
            fontSize: mediaqueryWidth(0.052, context),
            fontWeight: FontWeight.normal,
            fontColor: whiteColor),
        myFont("Successful",
            fontFamily: b612,
            fontSize: mediaqueryWidth(0.052, context),
            fontWeight: FontWeight.normal,
            fontColor: cyanColor),
      ],
    );
  }
}

 congratulationsFont(BuildContext context) {
  return  myFont("CONGRATULATIONS !",
        fontFamily: belleza,
        fontSize: mediaqueryWidth(0.07, context),
        fontWeight: FontWeight.normal,
        fontColor: whiteColor);
  }
