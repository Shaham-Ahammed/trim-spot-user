import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/login_eye_button_bloc/login_eye_button_bloc.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/login_screen/controllers.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
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
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: loginPasswordController,
      validator: (value) {
        if (value == "") {
          return "enter password";
        } else {
          return null;
        }
      },
      style: TextStyle(
          fontFamily: balooChettan,
          color: greyColor2,
          fontSize: mediaqueryHeight(0.024, context)),
      obscureText: context.watch<LoginEyeButtonBloc>().state.visible,
      cursorColor: cyanColor,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(onTap: () {
          context.read<LoginEyeButtonBloc>().add(EyeButtonPressed());
        }, child: BlocBuilder<LoginEyeButtonBloc, LoginEyeButtonState>(
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
