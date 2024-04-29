
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trim_spot_user_side/models/bookings_model.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/widgets/appointments_details/detailed_display_container.dart';

class StatusAndService extends StatelessWidget {
  const StatusAndService({
    super.key,
    required this.bookingModel,
  });

  final BookingsModel bookingModel;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        right: mediaqueryWidth(0.173, context),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: statusContainerColorSelector(bookingModel.status)),
          width: mediaqueryWidth(0.6, context),
          height: mediaqueryHeight(0.08, context),
          child: Column(
            children: [
              myFont(bookingModel.service,
                  fontFamily: cabinCondensed,
                  fontSize: mediaqueryHeight(0.03, context),
                  fontWeight: FontWeight.bold,
                  fontColor: blackColor),
              myFont(bookingModel.status.toUpperCase(),
                  fontFamily: balooChettan,
                  fontSize: mediaqueryHeight(0.018, context),
                  fontWeight: FontWeight.w700,
                  fontColor: whiteColor)
            ],
          ),
        ));
  }
}