import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';

  SnackBar errorSnackBar(String text) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      dismissDirection: DismissDirection.horizontal,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18), topRight: Radius.circular(18)),
      ),
      content: Center(child: Text(text)),
      backgroundColor: redErrorColor,
    );
  }