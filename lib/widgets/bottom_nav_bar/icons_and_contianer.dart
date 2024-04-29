import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/widgets/bottom_nav_bar/item_creator.dart';
  Row bottomNavIconsAndContainers(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        bottomNavIcons(context, Icons.home, 0),
        bottomNavIcons(context, Icons.search_outlined, 1),
        bottomNavIcons(context, Icons.event, 2),
        bottomNavIcons(context, Icons.person, 3),
      ]);
  }