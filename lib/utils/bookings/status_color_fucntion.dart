import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';

Color statusColorSelector(String status) {
  switch (status) {
    case 'pending':
      return Colors.yellow.shade600;
    case 'cancelled':
      return redErrorColor;
    default:
      return Colors.green.shade700;
  }
}
