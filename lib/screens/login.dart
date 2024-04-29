import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/google_sign_in_bloc/google_sign_in_bloc.dart';

import 'package:trim_spot_user_side/blocs/login_validation/login_validation_bloc.dart';
import 'package:trim_spot_user_side/screens/bottom_navigation.dart';
import 'package:trim_spot_user_side/screens/otp_verification.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/error_snackbars.dart';
import 'package:trim_spot_user_side/utils/login_screen/controllers.dart';
import 'package:trim_spot_user_side/utils/login_screen/formkey.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/page%20transitions/fade_transition.dart';
import 'package:trim_spot_user_side/utils/page%20transitions/slide_transition.dart';
import 'package:trim_spot_user_side/widgets/login_page_widgets/background_image.dart';
import 'package:trim_spot_user_side/widgets/login_page_widgets/google_signin.dart';
import 'package:trim_spot_user_side/widgets/login_page_widgets/loading_indicator.dart';
import 'package:trim_spot_user_side/widgets/login_page_widgets/login_button.dart';
import 'package:trim_spot_user_side/widgets/login_page_widgets/or_seperator.dart';
import 'package:trim_spot_user_side/widgets/login_page_widgets/resgister_text.dart';
import 'package:trim_spot_user_side/widgets/login_page_widgets/success_snackbar.dart';
import 'package:trim_spot_user_side/widgets/login_page_widgets/textformfields.dart';
import 'package:trim_spot_user_side/widgets/signup_screen/network_error_snackbar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      resizeToAvoidBottomInset: false,
      body: MultiBlocListener(
        listeners: [
          BlocListener<LoginValidationBloc, LoginValidationState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                Navigator.pop(context);
                Navigator.of(context).push(FadeTransitionPageRoute(
                    child: const BottomNavigationBarScreen()));
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
                ScaffoldMessenger.of(context)
                    .showSnackBar(networkErrorSnackbar(context));
              }
              if (state is EmailNotVerified) {
                  ScaffoldMessenger.of(context)
                    .showSnackBar(errorSnackBar("please verify your email"));
              }

              if (state is NavigateToOtPage) {
                    Navigator.pop(context);
                    Navigator.of(context).push(SlideTransitionPageRoute(
                    child: const OtpVerificationScreen(fromLogin: true,)));
              }

              if (state is AuthenticatingUser) {
                loadingIndicator(context);
              }
            },
          ),
          BlocListener<GoogleSignInBloc, GoogleSignInState>(
              listener: (context, state) {
            if (state is GoogleSigninSuccess) {
              Navigator.pop(context);
              Navigator.of(context).push(FadeTransitionPageRoute(
                  child: const BottomNavigationBarScreen()));
              loginSuccessSnackBar(context).show(context);
            }
            if (state is ProcessingLogin) {
              loadingIndicator(context);
            }
            if (state is FailedGoogleSignIn) {
              ScaffoldMessenger.of(context).showSnackBar(
                  errorSnackBar("Failed Logging in. Please try again"));
              Navigator.pop(context);
            }
          })
        ],
        child: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: backgroundImage(),
            child: SingleChildScrollView(
              reverse: true,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Padding(
                  padding: EdgeInsets.all(mediaqueryHeight(0.04, context)),
                  child: Form(
                    key: loginFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: mediaqueryHeight(0.41, context),
                        ),
                        const GoogleSignInWidget(),
                        SizedBox(
                          height: mediaqueryHeight(0.01, context),
                        ),
                        const OrSeperator(),
                        SizedBox(
                          height: mediaqueryHeight(0.03, context),
                        ),
                        const EmailLoginTextFormField(),
                        SizedBox(
                          height: mediaqueryHeight(0.03, context),
                        ),
                        const PasswordLoginTextFormfield(),
                        SizedBox(
                          height: mediaqueryHeight(0.04, context),
                        ),
                        const LoginButton(),
                        SizedBox(
                          height: mediaqueryHeight(0.04, context),
                        ),
                        const RegisterNowText()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
