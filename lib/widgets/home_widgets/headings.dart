import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';


nearbySalonsHeading(BuildContext context) {
  return  myFont("Nearby Salons",
        fontFamily: belleza,
        fontSize: mediaqueryHeight(0.025, context),
        fontWeight: FontWeight.normal,
        fontColor: whiteColor);
  }

  
  categoriesHeading(BuildContext context) {
  return  myFont("Categories",
        fontFamily: belleza,
        fontSize: mediaqueryHeight(0.025, context),
        fontWeight: FontWeight.normal,
        fontColor: whiteColor);
  }
