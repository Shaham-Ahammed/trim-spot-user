import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/utils/colors.dart';

Color statusColorSelector(String status) {
  switch (status) {
    case BookingHisotryUserDocumentModel.currentStatusPending:
      return Colors.yellow.shade600;
    case BookingHisotryUserDocumentModel.currentStatusCancelled:
      return redErrorColor;
    default:
      return Colors.green.shade700;
  }
}
