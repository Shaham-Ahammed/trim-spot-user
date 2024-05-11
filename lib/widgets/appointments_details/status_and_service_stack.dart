import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/utils/bookings/container_status_color.dart';

import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class StatusAndService extends StatelessWidget {
  const StatusAndService({super.key, required this.booking});

  final QueryDocumentSnapshot<Object?> booking;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        right: mediaqueryWidth(0.173, context),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: statusContainerColorSelector(
                  booking[BookingHisotryUserDocumentModel.currentStatus])),
          width: mediaqueryWidth(0.6, context),
          height: mediaqueryHeight(0.08, context),
          child: Column(
            children: [
              myFont(booking[BookingHisotryUserDocumentModel.service].toString().toUpperCase(),
                  fontFamily: cabinCondensed,
                  fontSize: mediaqueryHeight(0.03, context),
                  fontWeight: FontWeight.bold,
                  fontColor: blackColor),
              myFont(booking[BookingHisotryUserDocumentModel.currentStatus],
                  fontFamily: balooChettan,
                  fontSize: mediaqueryHeight(0.018, context),
                  fontWeight: FontWeight.w700,
                  fontColor: whiteColor)
            ],
          ),
        ));
  }
}
