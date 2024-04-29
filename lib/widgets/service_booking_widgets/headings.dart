import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

import 'package:trim_spot_user_side/utils/service_booking/total_slots.dart';
  slotSelectionSubtitle(BuildContext context) {
   return myFont(
        "( Please select ${slotsRequired(context)} consecutive available slots )",
        fontFamily: balooChettan,
        fontSize: mediaqueryHeight(0.017, context),
        fontWeight: FontWeight.normal,
        fontColor: Colors.white54);
  }

  selectSlotsHeading(BuildContext context) {
  return  myFont("SELECT SLOTS",
        fontFamily: belleza,
        fontSize: mediaqueryHeight(0.022, context),
        fontWeight: FontWeight.w500,
        fontColor: greyColor2);
  }