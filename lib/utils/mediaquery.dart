

import 'package:flutter/material.dart';

double mediaqueryHeight(double x,context) {
  return MediaQuery.of(context).size.height * x;
}

mediaqueryWidth(double x,context) {
  return MediaQuery.of(context).size.width * x;
}
