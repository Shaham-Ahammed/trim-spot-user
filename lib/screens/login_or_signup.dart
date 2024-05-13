import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/blocs/on_boarding_bloc/onboardind_bloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/widgets/login_or_signup_widgets/background_image.dart';
import 'package:trim_spot_user_side/widgets/login_or_signup_widgets/buttons.dart';
import 'package:trim_spot_user_side/widgets/login_or_signup_widgets/state_handler/state_handler.dart';

class LoginOrSignup extends StatelessWidget {
  const LoginOrSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: BlocListener<OnboardindBloc, OnboardindBlocState>(
          listener: (context, state) {
            LoginOrSignupStateHandler.handleState(context, state);
          },
          child: Stack(
            children: [
              const BackgroundImage(),
              loginButton(context),
              signupButton(context)
            ],
          ),
        ),
      ),
    );
  }
}
