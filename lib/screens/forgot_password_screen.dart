import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/forgot_password/controller.dart';
import 'package:trim_spot_user_side/utils/forgot_password/formkey.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/screen_padding.dart';
import 'package:trim_spot_user_side/utils/snack_bars.dart';
import 'package:trim_spot_user_side/utils/submit_button.dart';
import 'package:trim_spot_user_side/utils/textformfields.dart';
import 'package:trim_spot_user_side/widgets/login_page_widgets/loading_indicator.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
        listener: (context, state) {
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
        },
        child: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Padding(
              padding: commonScreenPadding(context),
              child: Form(
                key: forgotPasswordFormKey,
                child: Center(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: mediaqueryHeight(0.03, context),
                              color: whiteColor,
                            )),
                      ),
                      SizedBox(
                        height: mediaqueryHeight(0.16, context),
                      ),
                      Icon(
                        Icons.lock_open,
                        color: whiteColor,
                        size: mediaqueryHeight(0.07, context),
                      ),
                      SizedBox(
                        height: mediaqueryHeight(0.02, context),
                      ),
                      myFont("FORGET\nPASSWORD",
                          fontFamily: belleza,
                          fontSize: mediaqueryHeight(0.035, context),
                          fontWeight: FontWeight.w600,
                          fontColor: whiteColor,
                          textalign: TextAlign.center),
                      SizedBox(
                        height: mediaqueryHeight(0.02, context),
                      ),
                      myFont(
                          "Provide your account's email for which you want to reset your password",
                          fontFamily: balooChettan,
                          fontSize: mediaqueryHeight(0.02, context),
                          fontWeight: FontWeight.w400,
                          fontColor: greyColor3,
                          textalign: TextAlign.center),
                      SizedBox(
                        height: mediaqueryHeight(0.04, context),
                      ),
                      TextFormFieldCyan(
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an email';
                            }
                            final emailRegex = RegExp(
                                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

                            if (!emailRegex.hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          hintText: "Email",
                          controller: forgotPasswordEmailController),
                      SizedBox(
                        height: mediaqueryHeight(0.04, context),
                      ),
                      submitButtonCyan(
                        context,
                        text: "send email",
                        fontSize: mediaqueryHeight(0.023, context),
                        heigh: mediaqueryHeight(0.055, context),
                        width: mediaqueryWidth(0.5, context),
                        function: () {
                          context
                              .read<ForgotPasswordBloc>()
                              .add(SendEmailButtonPressedFromForgetPassword(context: context));
                          return null;
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }
}
