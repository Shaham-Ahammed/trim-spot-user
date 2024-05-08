import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class FadeTansitionAppLogo extends StatefulWidget {
  const FadeTansitionAppLogo({
    required this.size,
    super.key,
  });

  final double size;

  @override
  FadeTansitionAppLogoState createState() => FadeTansitionAppLogoState();
}

class FadeTansitionAppLogoState extends State<FadeTansitionAppLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1300),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Padding(
        padding: EdgeInsets.only(bottom: mediaqueryHeight(0.125, context)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            logoTrim(context, widget.size),
            logoSpot(context, widget.size),
          ],
        ),
      ),
    );
  }
}

Widget logoSpot(BuildContext context, double size) {
  return myFont(
    "SPOT",
    fontFamily: bebasNeue,
    fontSize: size,
    fontWeight: FontWeight.normal,
    fontColor: cyanColor,
  );
}

Widget logoTrim(BuildContext context, double size) {
  return myFont(
    "TRIM",
    fontFamily: bebasNeue,
    fontSize: size,
    fontWeight: FontWeight.normal,
    fontColor: whiteColor,
  );
}
