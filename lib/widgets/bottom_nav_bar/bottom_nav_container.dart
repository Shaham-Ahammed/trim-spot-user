import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/widgets/bottom_nav_bar/icons_and_contianer.dart';

Container bottomNavigationBarContainer(BuildContext context) {
  return Container(
    margin: EdgeInsets.all(mediaqueryHeight(0.02, context)),
    width: double.infinity,
    decoration: BoxDecoration(
        color: bottomNavBarColor, borderRadius: BorderRadius.circular(90)),
    height: mediaqueryHeight(0.09, context),
    child: bottomNavIconsAndContainers(context),
  );
}
