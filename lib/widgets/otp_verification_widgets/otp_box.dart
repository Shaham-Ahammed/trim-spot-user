import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/otp_page/form_key.dart';
import 'package:trim_spot_user_side/utils/otp_page/otp_controller.dart';

class OtpBoxe extends StatelessWidget {
  const OtpBoxe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerOtpFormKey,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.blueGrey, width: 2)),
        width: mediaqueryWidth(0.23, context),
        child: TextFormField(
          validator: (value) {
            if (value == "") {
              return "please enter the otp";
            } else if (value!.length < 6) {
              return "otp must contian 6 digits";
            } else {
              return null;
            }
          },
          enableInteractiveSelection: false,
          cursorColor: Colors.blueGrey,
          maxLength: 6,
          controller: registerOtpController,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: TextStyle(
              fontFamily: bebasNeue,
              fontSize: mediaqueryHeight(0.027, context)),
          decoration: InputDecoration(
              counterText: "",
              contentPadding: EdgeInsets.symmetric(
                  horizontal: mediaqueryWidth(0.02, context)),
              border: InputBorder.none,
              focusedBorder: InputBorder.none),
        ),
      ),
    );
  }
}
