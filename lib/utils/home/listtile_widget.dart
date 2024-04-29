import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

 ListTile drawerListTiles(BuildContext context,
      {required Function? Function()? function,
      required double iconSize,
      required String title,
      Color color = greyColor3,
      required IconData icon}) {
    return ListTile(
      onTap: function,
      leading: Icon(
        icon,
        color: color,
        size: iconSize,
      ),
      title: myFont(title,
          fontFamily: b612,
          fontSize: mediaqueryHeight(0.022, context),
          fontWeight: FontWeight.normal,
          fontColor: whiteColor),
    );
  }