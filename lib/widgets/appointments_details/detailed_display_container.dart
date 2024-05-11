import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/utils/bookings/container_status_color.dart';

import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

Container detailsDisplayArea(
    BuildContext context, final QueryDocumentSnapshot<Object?> bookingModel) {
  return Container(
    decoration: shadowAndColor(
        bookingModel[BookingHisotryUserDocumentModel.currentStatus]),
    height: mediaqueryHeight(0.21, context),
    width: double.infinity,
    padding: EdgeInsets.symmetric(
        vertical: mediaqueryHeight(0.02, context),
        horizontal: mediaqueryWidth(0.04, context)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        bookingDetailsFunction(context, Icons.calendar_month_outlined,
            bookingModel[BookingHisotryUserDocumentModel.date]),
        bookingDetailsFunction(context, Icons.schedule_rounded,
            bookingModel[BookingHisotryUserDocumentModel.time]),
        bookingDetailsFunction(context, Icons.store,
            "${bookingModel[BookingHisotryUserDocumentModel.shopName]}, ${bookingModel[BookingHisotryUserDocumentModel.shopLocation]}")
      ],
    ),
  );
}

Row bookingDetailsFunction(
    BuildContext context, IconData icon, String content) {
  return Row(
    children: [
      Icon(
        icon,
        color: blackColor,
        size: mediaqueryHeight(0.035, context),
      ),
      SizedBox(
        width: mediaqueryWidth(0.05, context),
      ),
      Expanded(
        child: Text(
          content,
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontFamily: balooChettan,
              fontSize: mediaqueryHeight(0.025, context),
              fontWeight: FontWeight.w600,
              color: blackColor),
        ),
      ),
    ],
  );
}
