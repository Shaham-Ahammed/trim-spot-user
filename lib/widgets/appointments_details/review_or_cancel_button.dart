import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/cancel_booking_bloc/cancel_booking_bloc_bloc.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';

import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/widgets/appointments_details/cancel_alert.dart';
import 'package:trim_spot_user_side/widgets/appointments_details/cannot_cancel_alert.dart';
import 'package:trim_spot_user_side/widgets/appointments_details/review_box.dart';

Center rateOrCancel(
    BuildContext context, final QueryDocumentSnapshot<Object?> bookingModel) {
  return Center(
    child: Material(
      color: availableActionContainerColor(
          bookingModel[BookingHisotryUserDocumentModel.currentStatus]),
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          onTapFunction(
              bookingModel[BookingHisotryUserDocumentModel.currentStatus],
              context,
              bookingModel);
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
              myFont(
                  availableActionText(bookingModel[
                      BookingHisotryUserDocumentModel.currentStatus]),
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

onTapFunction(String status, BuildContext context,
    QueryDocumentSnapshot<Object?> bookingDetails) {
  if (status == BookingHisotryUserDocumentModel.currentStatusPending) {
    context
        .read<CancelBookingBloc>()
        .add(CancelBookingPressed(bookingDetails: bookingDetails));

  } else if (status == BookingHisotryUserDocumentModel.currentStatusCompleted) {
    return reviewDialogue(context);
  }
}

Color availableActionContainerColor(String status) {
  if (status == BookingHisotryUserDocumentModel.currentStatusPending) {
    return redErrorColor;
  } else {
    return Colors.blueGrey;
  }
}

String availableActionText(String status) {
  if (status == BookingHisotryUserDocumentModel.currentStatusPending) {
    return "Cancel Booking";
  } else {
    return "Rate & Review";
  }
}
