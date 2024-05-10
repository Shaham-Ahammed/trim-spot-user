import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

import 'package:trim_spot_user_side/utils/service_booking/total_time.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/resusables.dart';

class TotalAmount extends StatelessWidget {
  const TotalAmount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            myFont("TOTAL AMOUNT",
                fontFamily: belleza,
                fontSize: mediaqueryHeight(0.018, context),
                fontWeight: FontWeight.w500,
                fontColor: greyColor2),
            SizedBox(
              height: mediaqueryHeight(0.008, context),
            ),
          ],
        ),
        Container(
            padding: containerPaddingServiceBooking(context),
            width: mediaqueryWidth(0.3, context),
            height: mediaqueryHeight(0.05, context),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: greyColor3,
                border: Border.all(color: greyColor, width: .4)),
            child: Align(
              alignment: Alignment.center,
              child: myFont("₹ ${totalAmountRequired(context)}",
                  fontFamily: cabinCondensed,
                  fontSize: mediaqueryHeight(0.023, context),
                  fontWeight: FontWeight.w500,
                  fontColor: whiteColor),
            )),
      ],
    );
  }
}
