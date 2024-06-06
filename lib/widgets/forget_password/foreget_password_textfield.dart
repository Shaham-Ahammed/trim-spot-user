import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/forgot_password/controller.dart';
import 'package:trim_spot_user_side/utils/textformfields.dart';

class ForgetPasswordTextField extends StatelessWidget {
  const ForgetPasswordTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormFieldCyan(
        validation: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter an email';
          }
          final emailRegex =
              RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

          if (!emailRegex.hasMatch(value)) {
            return 'Please enter a valid email';
          }
          return null;
        },
        hintText: "Email",
        controller: forgotPasswordEmailController);
  }
}
