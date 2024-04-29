import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/widgets/booking_success/lottie_animation.dart';
import 'package:trim_spot_user_side/widgets/booking_success/texts.dart';

class BookingSuccessMessageScreen extends StatefulWidget {
  const BookingSuccessMessageScreen({super.key});

  @override
  State<BookingSuccessMessageScreen> createState() =>
      _BookingSuccessMessageScreenState();
}

class _BookingSuccessMessageScreenState
    extends State<BookingSuccessMessageScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController successAnimationController;
  late Timer timer;
  @override
  void initState() {
    timer = Timer(const Duration(seconds: 2), () {
      Navigator.pop(context);
    });
    successAnimationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    successAnimationController.dispose();
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
                successAnimationController: successAnimationController),
            congratulationsFont(context),
            SizedBox(
              height: mediaqueryHeight(0.015, context),
            ),
            const BookingSuccessText()
          ],
        ),
      )),
    );
  }

 
}

