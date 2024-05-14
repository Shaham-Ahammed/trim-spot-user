import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/screens/signup.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/page%20transitions/fade_transition.dart';

class RegisterNowText extends StatelessWidget {
  const RegisterNowText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        myFont("Don't have an account ? ",
            fontFamily: balooChettan,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontColor: whiteColor),
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(FadeTransitionPageRoute(child: const SignUpScreen()));
          },
          child: myFont("Register Now",
              fontFamily: balooChettan,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontColor: cyanColor),
        )
      ],
    );
  }
}
