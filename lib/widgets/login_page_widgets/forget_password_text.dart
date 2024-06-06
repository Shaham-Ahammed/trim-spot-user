import 'package:flutter/material.dart';

import 'package:trim_spot_user_side/screens/forgot_password_screen.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/page%20transitions/fade_transition.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              FadeTransitionPageRoute(
                  child: const ForgotPasswordScreen()));
        },
        child: Align(
          alignment: Alignment.centerRight,
          child: myFont("forgot password ?",
              textalign: TextAlign.end,
              fontFamily: balooChettan,
              fontSize: mediaqueryHeight(0.016, context),
              fontWeight: FontWeight.w500,
              fontColor: Colors.blueGrey.shade200),
        ));
  }
}
