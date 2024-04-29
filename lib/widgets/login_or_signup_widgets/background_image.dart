import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/spalsh user.jpg",
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
