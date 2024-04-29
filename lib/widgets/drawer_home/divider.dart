import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:trim_spot_user_side/utils/colors.dart';

class DrawerDivider extends StatelessWidget {
  const DrawerDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: double.infinity,
      decoration: BoxDecoration(
          color: greyColor3,
          borderRadius: BorderRadius.circular(90)),
    );
  }
}

