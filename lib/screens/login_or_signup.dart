import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/blocs/on_boarding_bloc/onboardind_bloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/page%20transitions/fade_transition.dart';
import 'package:trim_spot_user_side/widgets/login_or_signup_widgets/background_image.dart';
import 'package:trim_spot_user_side/widgets/login_or_signup_widgets/buttons.dart';
import 'package:trim_spot_user_side/screens/login.dart';
import 'package:trim_spot_user_side/screens/signup.dart';

class LoginOrSignup extends StatelessWidget {
  const LoginOrSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: blackColor,
      body: SafeArea(
        child: BlocListener<OnboardindBloc, OnboardindBlocState>(
          listener: (context, state) {
            if (state is NavigateToLogin) {
              Navigator.of(context)
                  .push(FadeTransitionPageRoute(child: const LoginScreen()));
            }
            if (state is NavigateToSignUp) {
              Navigator.of(context)
                  .push(FadeTransitionPageRoute(child: const SignUpScreen()));
            }
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
