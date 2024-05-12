import 'package:flutter/material.dart';

import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

  servcieNameBookings(String service, BuildContext context) {
  return  myFont(service,
  overflow: TextOverflow.ellipsis,
        fontFamily: balooChettan,
        fontSize: mediaqueryHeight(0.018, context),
        fontWeight: FontWeight.w600,
        fontColor: whiteColor);
  }