import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/bookings/status_color_fucntion.dart';

import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

bookingStatus(String currentStatus, BuildContext context) {
  return myFont(currentStatus,
      fontFamily: balooChettan,
      fontSize: mediaqueryHeight(0.017, context),
      fontWeight: FontWeight.w700,
      fontColor: statusColorSelector(currentStatus));
}
