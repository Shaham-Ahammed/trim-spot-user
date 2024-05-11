import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/utils/colors.dart';

Color statusContainerColorSelector(String status) {
  switch (status) {
    case BookingHisotryUserDocumentModel.currentStatusPending:
      return const Color.fromRGBO(202, 196, 63, 1);
    case BookingHisotryUserDocumentModel.currentStatusCancelled:
      return redErrorColor;
    default:
      return Colors.green.shade700;
  }
}

 BoxDecoration shadowAndColor(String status) {
    return BoxDecoration(
      color: greyColor3,
      boxShadow: [
        BoxShadow(
          color: statusContainerColorSelector(status)
              .withOpacity(0.8), // Shadow color with 50% opacity black
          offset: const Offset(0, 6), // Specify downward shadow
          blurRadius: 8, // Adjust the blur radius for the shadow effect
        ),
      ],
    );
  }