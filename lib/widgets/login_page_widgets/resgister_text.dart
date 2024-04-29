import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/on_boarding_bloc/onboardind_bloc_bloc.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';

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
            context.read<OnboardindBloc>().add(SignUpButtonPressed());
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
