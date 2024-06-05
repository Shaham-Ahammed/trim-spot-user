import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/registration_password_eye_bloc/registration_password_eye_bloc.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
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
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: registerPasswordController,
      validator:(value) {
        if (value == "") {
          return "please enter a password";
        } else if (value!.length < 8) {
          return "password must contian atleast 8 characters";
        } else {
          return null;
        }
      },
      style: TextStyle(
          fontFamily: balooChettan,
          color: greyColor2,
          fontSize: mediaqueryHeight(0.024, context)),
      obscureText: context.watch<RegistrationPasswordEyeBloc>().state.visible,
      cursorColor: cyanColor,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(onTap: () {
          context.read<RegistrationPasswordEyeBloc>().add(SignUpEyeButtonPressed());
        }, child: BlocBuilder<RegistrationPasswordEyeBloc, RegistrationPasswordEyeState>(
          builder: (context, state) {
            return state.visible
                ? const Icon(
                    Icons.visibility_off,
                    color: greyColor3,
                  )
                : const Icon(Icons.visibility, color: greyColor3);
          },
        )),
        errorStyle: const TextStyle(
          fontSize: 13,
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(width: 2, color: Colors.red.shade900)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(width: 2, color: Colors.red.shade900)),
        counterText: "",
        filled: true,
        fillColor: Colors.black54,
        errorMaxLines: 2,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(width: 2, color: cyanColor)),
        prefix: Padding(
            padding: EdgeInsets.only(left: mediaqueryWidth(0.02, context))),
        contentPadding: EdgeInsets.symmetric(
            vertical: mediaqueryHeight(0.015, context),
            horizontal: mediaqueryWidth(0.04, context)),
        hintStyle: TextStyle(
            fontFamily: balooChettan,
            color: greyColor,
            fontSize: mediaqueryHeight(0.024, context)),
        hintText: "Password",
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: cyanColor),
            borderRadius: BorderRadius.circular(14)),
      ),
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
