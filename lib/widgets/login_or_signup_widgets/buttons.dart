import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/blocs/on_boarding_bloc/onboardind_bloc_bloc.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/widgets/login_or_signup_widgets/login_signup_buttons.dart';

  loginButton(BuildContext context) {
   return loginPageButtons(
              context: context,
              left: 0.07,
              text: "LOGIN",
              textColor: blackColor,
              containerColor: cyanColor,
              borderColor: cyanColor,
              function: () =>
                  context.read<OnboardindBloc>().add(LoginButtonPressed()));
  }
   signupButton(BuildContext context) {
   return loginPageButtons(
              context: context,
              left: 0.53,
              text: "SIGNUP",
              textColor: whiteColor,
              containerColor: transparentColor,
              borderColor: whiteColor,
              function: () =>
                  context.read<OnboardindBloc>().add(SignUpButtonPressed()));
  }