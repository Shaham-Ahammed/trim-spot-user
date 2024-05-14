import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/google_sign_in_bloc/google_sign_in_bloc.dart';
import 'package:trim_spot_user_side/blocs/login_validation/login_validation_bloc.dart';
import 'package:trim_spot_user_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_user_side/screens/bottom_navigation.dart';
import 'package:trim_spot_user_side/screens/otp_verification.dart';
import 'package:trim_spot_user_side/utils/login_screen/controllers.dart';
import 'package:trim_spot_user_side/utils/page%20transitions/fade_transition.dart';
import 'package:trim_spot_user_side/utils/page%20transitions/slide_transition.dart';
import 'package:trim_spot_user_side/utils/snack_bars.dart';
import 'package:trim_spot_user_side/widgets/login_page_widgets/loading_indicator.dart';
import 'package:trim_spot_user_side/widgets/login_page_widgets/success_snackbar.dart';
import 'package:trim_spot_user_side/widgets/signup_screen/network_error_snackbar.dart';

class LoginStateHandler {
  static void handlStateOfLoginValidationState(
      BuildContext context, LoginValidationState state) {
    if (state is LoginSuccess) {
      context.read<UserDetailsBloc>().add(FetchingUserDetailsFromFirebase());

      Navigator.of(context).pushAndRemoveUntil(
        FadeTransitionPageRoute(
          child: const BottomNavigationBarScreen(),
        ),
        (route) => false,
      );
      loginSuccessSnackBar(context).show(context);
    }

    if (state is IncorrectDetails) {
      loginPasswordController.clear();
      loginEmailController.clear();
      ScaffoldMessenger.of(context)
          .showSnackBar(errorSnackBar("incorrect email or password"));
      Navigator.pop(context);
    }
    if (state is NetworkError) {
      ScaffoldMessenger.of(context).showSnackBar(networkErrorSnackbar(context));
    }
    if (state is EmailNotVerified) {
      ScaffoldMessenger.of(context)
          .showSnackBar(errorSnackBar("please verify your email"));
    }

    if (state is NavigateToOtPage) {
      Navigator.pop(context);
      Navigator.of(context).push(SlideTransitionPageRoute(
          child: const OtpVerificationScreen(
        fromLogin: true,
      )));
    }

    if (state is AuthenticatingUser) {
      loadingIndicator(context);
    }
   
  }

  static void handleStateOfGoogleSignInState(
      BuildContext context, GoogleSignInState state) {
    if (state is GoogleSigninSuccess) {
      context.read<UserDetailsBloc>().add(FetchingUserDetailsFromFirebase());

      Navigator.of(context).pushAndRemoveUntil(
        FadeTransitionPageRoute(child: const BottomNavigationBarScreen()),
        (route) => false,
      );
      loginSuccessSnackBar(context).show(context);
    }
    if (state is ProcessingLogin) {
      loadingIndicator(context);
    }
    if (state is FailedGoogleSignIn) {
      ScaffoldMessenger.of(context)
          .showSnackBar(errorSnackBar("Failed Logging in. Please try again"));
      Navigator.pop(context);
    }
  }
}
