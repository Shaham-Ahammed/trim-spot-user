import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/privacy_policy/pp_text.dart';
import 'package:trim_spot_user_side/utils/screen_padding.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
          child: Padding(
        padding: commonScreenPadding(context),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: mediaqueryHeight(0.024, context),
                    color: greyColor2,
                  ),
                ),
                SizedBox(
                  width: mediaqueryWidth(0.05, context),
                ),
                (myFont("Privacy Policy",
                    fontFamily: belleza,
                    fontSize: mediaqueryHeight(0.028, context),
                    fontWeight: FontWeight.normal,
                    fontColor: whiteColor))
              ],
            ),
            SizedBox(
              height: mediaqueryHeight(0.02, context),
            ),
            (Expanded(
                child: SingleChildScrollView(
              child: Text(
                privacyPolicyText,
                textAlign: TextAlign.start,
                style: TextStyle(
                    overflow: null,
                    fontFamily: balooChettan,
                    fontSize: mediaqueryHeight(0.018, context),
                    fontWeight: FontWeight.normal,
                    color: whiteColor),
              ),
            )))
          ],
        ),
      )),
    );
  }
}
