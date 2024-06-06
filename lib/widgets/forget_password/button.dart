import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/submit_button.dart';

  sendEmailButton(BuildContext context) {
    return submitButtonCyan(
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
    );
  }