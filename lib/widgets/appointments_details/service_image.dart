import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/utils/bookings/service_imagepicker_function.dart';

import 'package:trim_spot_user_side/utils/mediaquery.dart';

class ServiceImage extends StatelessWidget {
  const ServiceImage({
    super.key,
    required this.booking,
  });

  final QueryDocumentSnapshot<Object?> booking;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: Hero(
      tag: booking[BookingHisotryUserDocumentModel.date] +
          booking[BookingHisotryUserDocumentModel.time] +
          booking[BookingHisotryUserDocumentModel.service],
      child: Container(
        width: double.infinity,
        height: mediaqueryHeight(0.4, context),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(serviceImagePicker(
                    booking[BookingHisotryUserDocumentModel.service])))),
      ),
    ));
  }
}
