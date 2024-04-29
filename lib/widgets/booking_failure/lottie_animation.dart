
import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:lottie/lottie.dart';

class TickMarkLottie extends StatelessWidget {
  const TickMarkLottie({
    super.key,
    required this.failureAnimationController,
  });

  final AnimationController failureAnimationController;

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
     height:mediaqueryHeight(0.3, context),
      onLoaded: (composition) {
      failureAnimationController.duration = composition.duration;
    }, repeat: false, "assets/animations/failed_animation.json");
  }
}