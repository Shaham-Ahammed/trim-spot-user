import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/register_page/controllers.dart';
import 'package:trim_spot_user_side/utils/textformfields.dart';

class ConfirmPasswordTextField extends StatelessWidget {
  const ConfirmPasswordTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormFieldCyan(
      validation: (value) {
        if (value == "") {
          return "please enter confirmation password";
        } else if (value != registerPasswordController.text) {
          return "password mismatch";
        } else {
          return null;
        }
      },
      controller: registerConfirmPasswordController,
      hintText: "Confirm Password",
      obscureText: true,
    );
  }
}

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormFieldCyan(
      validation: (value) {
        if (value == "") {
          return "please enter a password";
        } else if (value!.length < 8) {
          return "password must contian atleast 8 characters";
        } else {
          return null;
        }
      },
      controller: registerPasswordController,
      hintText: "Password",
      obscureText: true,
    );
  }
}

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormFieldCyan(
      validation: (value) {
        if (value == "") {
          return "please enter a phone number";
        } else if (value!.length < 10) {
          return "enter valid number";
        } else {
          return null;
        }
      },
      controller: registerPhoneController,
      hintText: "Phone",
      textInputType: TextInputType.number,
      maxLenght: 10,
    );
  }
}

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormFieldCyan(
      validation: (value) {
        if (value == "") {
          return "please enter a email";
        } else if (!value!.contains("@gmail.com")) {
          return "enter a valid email";
        } else {
          return null;
        }
      },
      controller: registerEmailController,
      hintText: "Email",
      textInputType: TextInputType.emailAddress,
    );
  }
}

class UsernameTextField extends StatelessWidget {
  const UsernameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormFieldCyan(
      validation: (value) {
        if (value == "") {
          return "please enter a username";
        } else {
          return null;
        }
      },
      controller: registerUsernameController,
      hintText: "Username",
      textInputType: TextInputType.name,
    );
  }
}
