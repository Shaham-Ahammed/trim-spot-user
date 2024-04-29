 import 'package:flutter/material.dart';

final List<FocusNode> focusNodesOtp= List.generate(4, (index) => FocusNode()) ;

  final List<TextEditingController> controllersOtp=List.generate(
      4,
      (index) => TextEditingController(),
    );

  void onOtpChangedProfile(String newText, int index,context) {
    if (newText.isNotEmpty) {
      if (index <3) {
        FocusScope.of(context).requestFocus(focusNodesOtp[index + 1]);
      } else {
  
      }
    }
  }