import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class HeadingAndBackButton extends StatelessWidget {
  const HeadingAndBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: mediaqueryHeight(0.024, context),
            color: greyColor2,
          ),
        ),
        SizedBox(
          width: mediaqueryWidth(0.05, context),
        ),
        (myFont("My Bookmarks",
            fontFamily: belleza,
            fontSize: mediaqueryHeight(0.028, context),
            fontWeight: FontWeight.normal,
            fontColor: whiteColor))
      ],
    );
  }
}