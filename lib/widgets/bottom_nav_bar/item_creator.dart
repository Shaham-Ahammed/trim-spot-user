import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/bottom_nav_bloc/bottom_navigation_bloc.dart';
import 'package:trim_spot_user_side/utils/bottom_navigation/page_changing_listener.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
  Material bottomNavIcons(
      BuildContext context, IconData icon, int itemPosition) {
    final isSelected = bottomBarIconColor(context) == itemPosition;
    const selectedColor = cyanColor;
    const deselectedColor = nonSelectedIconBackgroundColor;

    return Material(
      borderRadius: BorderRadius.circular(90),
      color: isSelected ? selectedColor : deselectedColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(90),
        onTap: () {
          context
              .read<BottomNavigationBloc>()
              .add(BottomNavBarPressed(currentPage: itemPosition));
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          padding: EdgeInsets.all(mediaqueryHeight(0.02, context)),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? selectedColor : deselectedColor,
          ),
          child: Icon(
            icon,
            color: isSelected ? blackColor : whiteColor,
          ),
        ),
      ),
    );
  }