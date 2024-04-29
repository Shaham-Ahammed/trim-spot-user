import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

  SnackBar networkErrorSnackbar(BuildContext context) {
    return SnackBar(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18), topRight: Radius.circular(18)),
      ),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      dismissDirection: DismissDirection.startToEnd,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.signal_cellular_connected_no_internet_0_bar_sharp,
            color: whiteColor,
          ),
          SizedBox(
            width: mediaqueryWidth(0.04, context),
          ),
          const Text("check your network connection"),
        ],
      ),
    );
  }

