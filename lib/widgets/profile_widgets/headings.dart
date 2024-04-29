
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';


profilePageHeadings(BuildContext context, String heading) {
    return myFont(heading,
        fontFamily: balooChettan,
        fontSize: mediaqueryHeight(0.02, context),
        fontWeight: FontWeight.w600,
        fontColor: subTitlesTextGrey);
  }