import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trim_spot_user_side/models/bookings_model.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class ServiceImage extends StatelessWidget {
  const ServiceImage({
    super.key,
    required this.bookingModel,
  });

  final BookingsModel bookingModel;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: Hero(
      tag: bookingModel.date + bookingModel.time,
      child: Container(
        width: double.infinity,
        height: mediaqueryHeight(0.4, context),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(bookingModel.serviceImage))),
      ),
    ));
  }
}
