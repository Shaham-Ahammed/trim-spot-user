import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

import 'package:trim_spot_user_side/utils/service_booking/total_time.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/resusables.dart';
  Container totalTimeContainerField(BuildContext context) {
    return Container(
        padding: containerPaddingServiceBooking(context),
        width: mediaqueryWidth(0.3, context),
        height: mediaqueryHeight(0.06, context),
        decoration: containerBoxDecoration(blackColor),
        child: Align(
          alignment: Alignment.center,
          child: myFont("${totalTimeRequired(context)} min",
              fontFamily: cabinCondensed,
              fontSize: mediaqueryHeight(0.023, context),
              fontWeight: FontWeight.w500,
              fontColor: whiteColor),
        ));
  }