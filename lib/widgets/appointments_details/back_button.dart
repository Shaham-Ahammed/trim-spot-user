import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class BackButtonBookinDetails extends StatelessWidget {
  const BackButtonBookinDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: mediaqueryHeight(0.01, context),
      left: mediaqueryWidth(0.02, context),
      child: Material(
        color: greyColor,
        borderRadius: BorderRadius.circular(90),
        child: InkWell(
          borderRadius: BorderRadius.circular(90),
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: mediaqueryHeight(0.04, context),
            width: mediaqueryHeight(0.04, context),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: mediaqueryHeight(0.024, context),
            ),
          ),
        ),
      ),
    );
  }
}
