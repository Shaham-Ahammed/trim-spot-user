 import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/widgets/signup_screen/loading_indicator.dart';

Future<dynamic> loadingIndicator(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(child: RegisterLoadingIndicator());
      },
    );
  }