import 'package:flutter/material.dart';

BoxDecoration backgroundImage() {
  return const BoxDecoration(
      image: DecorationImage(
          image: AssetImage(
            "assets/images/spalsh user blur.jpg",
          ),
          fit: BoxFit.cover));
}
