import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/models/bookings_model.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

  bookingStatus(BookingsModel myBookings, BuildContext context) {
return    myFont(myBookings.status.toUpperCase(),
        fontFamily: balooChettan,
        fontSize: mediaqueryHeight(0.017, context),
        fontWeight: FontWeight.w700,
        fontColor: myBookings.statusColor);
  }