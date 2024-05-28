import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class TextFormFieldCyan extends StatelessWidget {
  const TextFormFieldCyan(
      {super.key,
      required this.hintText,
      this.validation,
      this.obscureText = false,
      this.textInputType = TextInputType.text,
      this.maxLenght,
      required this.controller,
      this.filteringTextInputFormatter});
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validation;
  final TextInputType textInputType;
  final FilteringTextInputFormatter? filteringTextInputFormatter;
  final bool obscureText;
  final int? maxLenght;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      keyboardType: textInputType,
      validator: validation,
      inputFormatters: filteringTextInputFormatter == null
          ? null
          : [filteringTextInputFormatter!],
      maxLength: maxLenght ?? maxLenght,
      style:  TextStyle(
        
          fontFamily: balooChettan, color: greyColor2, fontSize: mediaqueryHeight(0.024, context)),
      obscureText: obscureText,
      cursorColor: cyanColor,
      decoration: InputDecoration(
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
        hintStyle:  TextStyle(
            fontFamily: balooChettan, color: greyColor, fontSize: mediaqueryHeight(0.024, context)),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: cyanColor),
            borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}
