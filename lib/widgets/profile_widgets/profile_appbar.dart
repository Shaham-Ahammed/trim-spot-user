import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/logout_alert.dart';

class HeadingAndLogoutButton extends StatelessWidget {
  const HeadingAndLogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaqueryHeight(0.07, context),
      decoration: const BoxDecoration(
          color: nonSelectedIconBackgroundColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(45),
              bottomRight: Radius.circular(0))),
      padding: EdgeInsets.only(
          left: mediaqueryWidth(0.05, context),
          right: mediaqueryWidth(0.023, context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          myFont("Profile",
              fontFamily: belleza,
              fontSize: mediaqueryHeight(0.028, context),
              fontWeight: FontWeight.normal,
              fontColor: whiteColor),
          IconButton(
              onPressed: () {
                logoutConfirmation(context);
              },
              icon: Icon(
                Icons.logout_outlined,
                size: mediaqueryWidth(0.07, context),
                color: cyanColor,
              ))
        ],
      ),
    );
  }
}
