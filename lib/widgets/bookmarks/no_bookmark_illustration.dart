import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class NoBookmarksIllustrationAndText extends StatelessWidget {
  const NoBookmarksIllustrationAndText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: mediaqueryHeight(0.22, context),
          ),
          Image.asset(
            "assets/images/bookmarks1.png",
            height: mediaqueryHeight(0.25, context),
          ),
          myFont("Bookmark your favorites shops\n to see them here.",
              textalign: TextAlign.center,
              fontFamily: balooChettan,
              fontSize: mediaqueryHeight(0.02, context),
              fontWeight: FontWeight.w400,
              fontColor: whiteColor)
        ],
      ),
    );
  }
}