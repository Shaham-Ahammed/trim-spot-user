import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/login_validation/login_validation_bloc.dart';
import 'package:trim_spot_user_side/blocs/registration_bloc/form_validation_bloc.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/widgets/otp_page/heading_texts.dart';
import 'package:trim_spot_user_side/widgets/otp_page/resend_email_button.dart';
import 'package:trim_spot_user_side/widgets/otp_page/submit_button.dart';
import 'package:trim_spot_user_side/widgets/otp_verification_widgets/backgorund_image.dart';
import 'package:trim_spot_user_side/widgets/otp_verification_widgets/state_handler/state_handler.dart';

import 'package:trim_spot_user_side/widgets/signup_screen/screen_padding.dart';

class OtpVerificationScreen extends StatelessWidget {
  final bool fromLogin;
  const OtpVerificationScreen({super.key, required this.fromLogin});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<FormValidationBloc, FormValidationState>(
          listener: (context, state) {
            OtpVerificationStateHandler.handleStateOfRegistration(
                context, state);
          },
        ),
        BlocListener<LoginValidationBloc, LoginValidationState>(
          listener: (context, state) {
            OtpVerificationStateHandler.handleStateOfLogin(context, state);
          },
        ),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: blackColor,
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: backgorundImageOtpVerification(),
            child: SingleChildScrollView(
              child: Padding(
                padding: screenPadding(context),
                child: Column(
                  children: [
                    pageTitle(context),
                    SizedBox(
                      height: mediaqueryHeight(0.26, context),
                    ),
                    const EmailVerificationMessage(),
                    SizedBox(
                      height: mediaqueryHeight(0.029, context),
                    ),
                    submitButton(context, fromLogin),
                    SizedBox(
                      height: mediaqueryHeight(0.19, context),
                    ),
                    resendEmailText(context),
                    ResendEmailButton(
                      fromLogin: fromLogin,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
