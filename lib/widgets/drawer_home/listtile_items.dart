import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/bottom_nav_bloc/bottom_navigation_bloc.dart';
import 'package:trim_spot_user_side/screens/customer_support.dart';
import 'package:trim_spot_user_side/utils/home/listtile_widget.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/page%20transitions/fade_transition.dart';
import 'package:trim_spot_user_side/widgets/drawer_home/version_number.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/logout_alert.dart';

Expanded listviewDrawerHome(BuildContext context) {
  return Expanded(
    child: ListView(
      children: [
        drawerListTiles(context, iconSize: mediaqueryHeight(0.03, context),
            function: () {
          Navigator.pop(context);
          return null;
        }, icon: Icons.home_outlined, title: "Home"),
        drawerListTiles(context, iconSize: mediaqueryHeight(0.029, context),
            function: () {
          Navigator.pop(context);
          context
              .read<BottomNavigationBloc>()
              .add(BottomNavBarPressed(currentPage: 1));
          return null;
        }, icon: Icons.search, title: "Search"),
        drawerListTiles(context, iconSize: mediaqueryHeight(0.029, context),
            function: () {
          Navigator.pop(context);
         context
              .read<BottomNavigationBloc>()
              .add(BottomNavBarPressed(currentPage: 2));
          return null;
        }, icon: Icons.event, title: "My Appointments"),
        drawerListTiles(context, iconSize: mediaqueryHeight(0.029, context),
            function: () {
          Navigator.pop(context);
           context
              .read<BottomNavigationBloc>()
              .add(BottomNavBarPressed(currentPage: 3));
          return null;
        }, icon: Icons.person_3_outlined, title: "Profile"),
        drawerListTiles(context, iconSize: mediaqueryHeight(0.029, context),
            function: () {

          return null;
        }, icon: Icons.bookmark_border_rounded, title: "Bookmarked"),
        drawerListTiles(context, iconSize: mediaqueryHeight(0.029, context),
            function: () {
          Navigator.pop(context);
          Navigator.of(context).push(FadeTransitionPageRoute(
              child: const CustomerSupport()));
          return null;
        }, icon: Icons.headset_mic_outlined, title: "Customer Support"),
        drawerListTiles(context, iconSize: mediaqueryHeight(0.029, context),
            function: () {
          return null;
        }, icon: Icons.list_alt_outlined, title: "Terms & Conditions"),
        drawerListTiles(context, iconSize: mediaqueryHeight(0.029, context),
            function: () {
          return null;
        }, icon: Icons.privacy_tip_outlined, title: "Privacy Policy"),
        drawerListTiles(context, iconSize: mediaqueryHeight(0.029, context),
            function: () {
          return null;
        },
            color: Colors.yellow.shade600,
            icon: Icons.star_rate_rounded,
            title: "Rate Us"),
        drawerListTiles(context, iconSize: mediaqueryHeight(0.029, context),
            function: () {
          logoutConfirmation(context);
          return null;
        }, icon: Icons.logout_outlined, title: "Logout"),
        SizedBox(
          height: mediaqueryHeight(0.03, context),
        ),
        versionNumber(context),
      ],
    ),
  );
}
