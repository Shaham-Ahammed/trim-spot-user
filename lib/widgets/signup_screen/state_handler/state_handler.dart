

import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/blocs/user_form_validation/form_validation_bloc.dart';
import 'package:trim_spot_user_side/screens/otp_verification.dart';
import 'package:trim_spot_user_side/utils/page%20transitions/slide_transition.dart';
import 'package:trim_spot_user_side/utils/register_page/controllers.dart';
import 'package:trim_spot_user_side/utils/snack_bars.dart';
import 'package:trim_spot_user_side/widgets/login_page_widgets/loading_indicator.dart';
import 'package:trim_spot_user_side/widgets/signup_screen/network_error_snackbar.dart';

class SignupStateHandler{
  static void handleState(BuildContext context , FormValidationState state){
  
                if (state is NetworkError) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(networkErrorSnackbar(context));
                }

                if (state is LoadingState) {
                  loadingIndicator(context);
                }
                if (state is RegisrationFailureFromSignUpPage) {
                  registerEmailController.clear();
                  ScaffoldMessenger.of(context)
                      .showSnackBar(errorSnackBar(state.exception));
                  Navigator.pop(context);
                }
                if (state is NavigateToEmailVerficationPageFromRegister) {
                  Navigator.pop(context);
                  Navigator.of(context).push(SlideTransitionPageRoute(
                      child: const OtpVerificationScreen(
                    fromLogin: false,
                  )));
                }
  }
}