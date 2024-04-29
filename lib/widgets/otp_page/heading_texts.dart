import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

resendEmailText(context) {
  return myFont("click the button below to resend email.",
      fontFamily: balooChettan,
      textalign: TextAlign.center,
      fontSize: mediaqueryHeight(0.015, context),
      fontWeight: FontWeight.w500,
      fontColor: whiteColor);
}


class EmailVerificationMessage extends StatelessWidget {
  const EmailVerificationMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Almost there! ',
            style: TextStyle(color: cyanColor, fontFamily: balooChettan,
      fontSize: mediaqueryHeight(0.02, context),
      fontWeight: FontWeight.w700,
     ),
          ),
          TextSpan(
            text:
                "We've sent a verification link to your registered email address. Click the link to complete the verification process. To proceed, please click the button below after verifying your email.",
            style: TextStyle( fontFamily: balooChettan,
      fontSize: mediaqueryHeight(0.02, context),
      fontWeight: FontWeight.w700,
      color: whiteColor),
          ),
        ],
      ),
    );
  }
}


pageTitle(BuildContext context) {
  return myFont("Email Verification",
      fontFamily: cabinCondensed,
      fontSize: mediaqueryHeight(0.04, context),
      fontWeight: FontWeight.w600,
      fontColor: whiteColor);
}
