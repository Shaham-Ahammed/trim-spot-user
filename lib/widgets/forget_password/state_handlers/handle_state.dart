
import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/blocs/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:trim_spot_user_side/utils/snack_bars.dart';
import 'package:trim_spot_user_side/widgets/login_page_widgets/loading_indicator.dart';

class ForgetPasswordStateHandler {
  static void handleState(BuildContext context, ForgotPasswordState state) {
      if (state is LoadingIndicatorOnForgotPassword) {
            loadingIndicator(context);
          }
          if (state is EmailSendingSuccessfull) {
            Navigator.pop(context);
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(successSnackBar(
                "email for resetting password has been send to your email"));
          }
          if (state is SomethingWentWrong) {
            Navigator.pop(context);
      
            ScaffoldMessenger.of(context).showSnackBar(
                errorSnackBar("something went wrong. Please try again"));
          }
            if (state is UserNotRegistered) {
            Navigator.pop(context);
      
            ScaffoldMessenger.of(context).showSnackBar(
                errorSnackBar("user not registered"));
          }
          
  }
}
