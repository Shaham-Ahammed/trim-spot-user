// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/data/shared_preference/functions.dart';
import 'package:trim_spot_user_side/screens/login.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/home/scaffold_key.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/page%20transitions/fade_transition.dart';

Future<dynamic> logoutConfirmation(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            width: mediaqueryHeight(0.8, context),
            height: mediaqueryHeight(0.15, context),
            padding: EdgeInsets.all(mediaqueryHeight(0.02, context)),
            decoration: BoxDecoration(
              color: blackColor,
              border: Border.all(color: cyanColor, width: 2),
              borderRadius: BorderRadius.circular(
                14,
              ),
            ),
            child: Column(
              children: [
                myFont("Confirm Logout ?",
                    fontFamily: balooChettan,
                    fontSize: mediaqueryHeight(0.023, context),
                    fontWeight: FontWeight.w500,
                    fontColor: whiteColor),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: myFont("Cancel",
                          fontFamily: balooChettan,
                          fontSize: mediaqueryHeight(0.022, context),
                          fontWeight: FontWeight.w600,
                          fontColor: whiteColor),
                    ),
                    Container(
                      height: mediaqueryHeight(0.03, context),
                      width: 1,
                      color: greyColor3,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await SharedPreferenceOperation().setGmail("");
                        homeScaffoldKey.currentState?.closeDrawer();
                        Navigator.of(context).pushAndRemoveUntil(
                          FadeTransitionPageRoute(
                            child: const LoginScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      child: myFont("Logout",
                          fontFamily: balooChettan,
                          fontSize: mediaqueryHeight(0.022, context),
                          fontWeight: FontWeight.w600,
                          fontColor: Colors.red.shade800),
                    ),
                  ],
                ),
                SizedBox(
                  height: mediaqueryHeight(0.015, context),
                )
              ],
            ),
          ),
        );
      });
}
