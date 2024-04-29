import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class BackButton extends StatelessWidget {
  const BackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: mediaqueryWidth(0.04, context),
        top: mediaqueryHeight(0.02, context),
        child: Material(
          color: greyColor3,
          borderRadius: BorderRadius.circular(90),
          child: InkWell(
            borderRadius: BorderRadius.circular(90),
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: mediaqueryHeight(0.035, context),
              width: mediaqueryHeight(0.035, context),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: mediaqueryHeight(0.024, context),
              ),
            ),
          ),
        ));
  }
}
