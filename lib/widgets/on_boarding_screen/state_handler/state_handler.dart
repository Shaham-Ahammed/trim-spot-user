import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/blocs/on_boarding_bloc/onboardind_bloc_bloc.dart';
import 'package:trim_spot_user_side/screens/login_or_signup.dart';
import 'package:trim_spot_user_side/utils/page%20transitions/fade_transition.dart';

class OnBoardingStateHandler{
  static void handlerState(BuildContext context , OnboardindBlocState state,PageController pageController){
      if (state is NavigateToSecondOnBoardingPage) {
          pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn);
        }
        if (state is NavigateToLoginOrSignupPage) {
          Navigator.of(context).pushReplacement(FadeTransitionPageRoute(
            child: const LoginOrSignup(),
          ));
        }
  }
}