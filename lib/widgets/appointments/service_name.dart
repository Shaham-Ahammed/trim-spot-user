import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/models/bookings_model.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

  servcieNameBookings(BookingsModel myBookings, BuildContext context) {
  return  myFont(myBookings.service,
        fontFamily: balooChettan,
        fontSize: mediaqueryHeight(0.018, context),
        fontWeight: FontWeight.w600,
        fontColor: whiteColor);
  }