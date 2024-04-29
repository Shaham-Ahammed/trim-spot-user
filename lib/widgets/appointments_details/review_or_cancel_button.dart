import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/models/bookings_model.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/widgets/appointments_details/cancel_alert.dart';
import 'package:trim_spot_user_side/widgets/appointments_details/review_box.dart';

Center rateOrCancel(BuildContext context, BookingsModel bookingModel) {
  return Center(
    child: Material(
      color: availableActionContainerColor(bookingModel.status),
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          onTapFunction(bookingModel.status, context);
        },
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: mediaqueryWidth(0.02, context)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          height: mediaqueryHeight(0.06, context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              myFont(availableActionText(bookingModel.status),
                  fontFamily: b612,
                  fontSize: mediaqueryHeight(0.02, context),
                  fontWeight: FontWeight.w500,
                  fontColor: whiteColor),
            ],
          ),
        ),
      ),
    ),
  );
}

onTapFunction(String status, context) {
  if (status == "pending") {
    return cancelAlertDialogue(context);
  } else if (status == "completed") {
    return reviewDialogue(context);
  }
}

Color availableActionContainerColor(String status) {
  if (status == "pending") {
    return redErrorColor;
  } else {
    return Colors.blueGrey;
  }
}

String availableActionText(String status) {
  if (status == "pending") {
    return "Cancel Booking";
  } else {
    return "Rate & Review";
  }
}
