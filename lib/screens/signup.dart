import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/user_form_validation/form_validation_bloc.dart';
import 'package:trim_spot_user_side/screens/otp_verification.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/error_snackbars.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/page%20transitions/slide_transition.dart';
import 'package:trim_spot_user_side/utils/register_page/controllers.dart';
import 'package:trim_spot_user_side/utils/register_page/formkey.dart';
import 'package:trim_spot_user_side/widgets/login_page_widgets/background_image.dart';
import 'package:trim_spot_user_side/widgets/login_page_widgets/loading_indicator.dart';
import 'package:trim_spot_user_side/widgets/signup_screen/profile_image.dart';
import 'package:trim_spot_user_side/widgets/signup_screen/profile_image_error.dart';
import 'package:trim_spot_user_side/widgets/signup_screen/register_button.dart';
import 'package:trim_spot_user_side/widgets/signup_screen/screen_padding.dart';
import 'package:trim_spot_user_side/widgets/signup_screen/network_error_snackbar.dart';
import 'package:trim_spot_user_side/widgets/signup_screen/sizedbox.dart';
import 'package:trim_spot_user_side/widgets/signup_screen/textformfields.dart';
import 'package:trim_spot_user_side/widgets/signup_screen/welcome.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: backgroundImage(),
          child: SingleChildScrollView(
            child: BlocConsumer<FormValidationBloc, FormValidationState>(
              listener: (context, state) {
                if (state is UserNameExists) {
                  registerUsernameController.clear();
                  ScaffoldMessenger.of(context)
                      .showSnackBar(errorSnackBar("username already exists"));
                  Navigator.pop(context);
                }
                if (state is NetworkError) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(networkErrorSnackbar(context));
                }

                if (state is LoadingState) {
                  loadingIndicator(context);
                }
                if (state is RegisrationFailure) {
                  registerEmailController.clear();
                  ScaffoldMessenger.of(context)
                      .showSnackBar(errorSnackBar(state.exception));
                  Navigator.pop(context);
                }
                if (state is NavigateToEmailVerficationPage) {
                  Navigator.of(context).push(
                      SlideTransitionPageRoute(child: const OtpVerificationScreen(fromLogin: false,)));
                }
              },
              builder: (context, state) {
                return Padding(
                  padding: screenPadding(context),
                  child: Form(
                    key: registerFormKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: mediaqueryHeight(0.04, context),
                        ),
                        welcomeText(),
                        SizedBox(
                          height: mediaqueryHeight(0.02, context),
                        ),
                        const ProfileImage(),
                        const ProfileImageError(),
                        SizedBox(
                          height: mediaqueryHeight(0.03, context),
                        ),
                        const UsernameTextField(),
                        textFormFieldSizedBox(context),
                        const EmailTextField(),
                        textFormFieldSizedBox(context),
                        const PhoneTextField(),
                        textFormFieldSizedBox(context),
                        const PasswordTextField(),
                        textFormFieldSizedBox(context),
                        const ConfirmPasswordTextField(),
                        SizedBox(
                          height: mediaqueryHeight(0.04, context),
                        ),
                        const RegisterButton(),
                        SizedBox(height: mediaqueryHeight(0.06, context)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
