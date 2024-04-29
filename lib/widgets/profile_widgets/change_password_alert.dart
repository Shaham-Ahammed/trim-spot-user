
import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/submit_button.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/newpassword_textfield.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/oldpassword_textfield.dart';

  Future<dynamic> changePasswordAlert(BuildContext context) {
    return showDialog(
      barrierColor: Colors.black87,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: blackColor,
          insetPadding:
              EdgeInsets.symmetric(horizontal: mediaqueryWidth(0.02, context)),
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: greyColor3,
            ),
            borderRadius: BorderRadius.all(
              Radius.zero,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: mediaqueryHeight(0.02, context),
                horizontal: mediaqueryHeight(0.03, context)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                myFont("Change Password",
                    fontFamily: balooChettan,
                    fontSize: mediaqueryHeight(0.024, context),
                    fontWeight: FontWeight.normal,
                    fontColor: whiteColor),
                SizedBox(
                  height: mediaqueryHeight(0.017, context),
                ),
                const OldPasswordTextField(),
                SizedBox(
                  height: mediaqueryHeight(0.018, context),
                ),
                const NewPasswordTextFormField(),
                SizedBox(
                  height: mediaqueryHeight(0.018, context),
                ),
                submitButtonCyan(context,
                    text: "submit",
                    heigh: mediaqueryHeight(0.03, context),
                    width: mediaqueryWidth(0.2, context),
                    fontSize: mediaqueryHeight(0.018, context), function: () {
                  Navigator.pop(context);
                  return null;
                })
              ],
            ),
          ),
        );
      },
    );
  }