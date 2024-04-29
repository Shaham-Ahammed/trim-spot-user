import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/profile_screen/controllers.dart';

class Textfield extends StatelessWidget {
  const Textfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: mediaqueryWidth(0.02, context)),
      decoration: BoxDecoration(
          color: greyColor, borderRadius: BorderRadius.circular(8)),
      width: double.infinity,
      height: mediaqueryHeight(0.06, context),
      child: TextFormField(
        controller: newPhoneController,
        cursorColor: blackColor,
        maxLength: 10,
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(
            hintStyle: TextStyle(fontSize: 14),
            hintText: "enter new number",
            counterText: "",
            focusedBorder: InputBorder.none,
            border: InputBorder.none),
      ),
    );
  }
}
