import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/login_screen/controllers.dart';
import 'package:trim_spot_user_side/utils/textformfields.dart';

class EmailLoginTextFormField extends StatelessWidget {
  const EmailLoginTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormFieldCyan(
      validation: (value) {
        if (value == "") {
          return "enter email";
        } else {
          return null;
        }
      },
      controller: loginEmailController,
      hintText: "Email",
      textInputType: TextInputType.emailAddress,
    );
  }
}

class PasswordLoginTextFormfield extends StatelessWidget {
  const PasswordLoginTextFormfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormFieldCyan(
      validation: (value) {
        if (value == "") {
          return "enter password";
        } else {
          return null;
        }
      },
      controller: loginPasswordController,
      hintText: "Password",
      obscureText: true,
    );
  }
}
