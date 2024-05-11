import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/widgets/booking_failure/lottie_animation.dart';

import 'package:trim_spot_user_side/widgets/booking_failure/texts.dart';

class BookingFailureMessageScreen extends StatefulWidget {
  const BookingFailureMessageScreen({super.key});

  @override
  State<BookingFailureMessageScreen> createState() =>
      _BookingFailureMessageScreenState();
}

class _BookingFailureMessageScreenState
    extends State<BookingFailureMessageScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController failureAnimationController;
  late Timer timer;
  @override
  void initState() {
    timer = Timer(const Duration(seconds: 3), () {
      Navigator.pop(context);
    });
    failureAnimationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    failureAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: mediaqueryHeight(0.24, context),
            ),
            TickMarkLottie(
                failureAnimationController: failureAnimationController),
            tryAgainText(context),
            SizedBox(
              height: mediaqueryHeight(0.015, context),
            ),
            const BookingFailureMessage()
          ],
        ),
      )),
    );
  }

 
}

