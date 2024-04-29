import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/screens/otp_verification_profile_section.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/page%20transitions/no_transition_page_route.dart';
import 'package:trim_spot_user_side/utils/submit_button.dart';

class VerifyButton extends StatelessWidget {
  const VerifyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: submitButtonCyan(context,
            heigh: mediaqueryHeight(0.05, context),
            text: "verify",
            fontSize: mediaqueryHeight(0.024, context),
            width: mediaqueryWidth(0.35, context), function: () {
      Navigator.of(context).push(NoTransitionPageRoute(
          child: const OtpVerficationProfileSection()));
      return null;
    }));
  }
}

