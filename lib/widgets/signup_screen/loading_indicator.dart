import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class RegisterLoadingIndicator extends StatelessWidget {
  const RegisterLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: .2,
      child: Column(
        children: [
          SizedBox(
            height: mediaqueryHeight(0.36, context),
          ),
          const LoadingIndicator(
              indicatorType: Indicator.ballSpinFadeLoader,
              colors: [cyanColor, whiteColor],
              strokeWidth: 1,
              pathBackgroundColor: Colors.black)
        ],
      ),
    );
  }
}
