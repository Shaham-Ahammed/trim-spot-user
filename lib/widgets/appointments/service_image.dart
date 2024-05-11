import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/utils/bookings/service_imagepicker_function.dart';

import 'package:trim_spot_user_side/utils/mediaquery.dart';

class BookingsImage extends StatelessWidget {
  const BookingsImage({
    super.key,
    required this.booking,
  });

  final QueryDocumentSnapshot<Object?> booking;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: booking[BookingHisotryUserDocumentModel.date] +
          booking[BookingHisotryUserDocumentModel.time] +
          booking[BookingHisotryUserDocumentModel.service],
      child: Container(
        width: mediaqueryWidth(0.2, context),
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(serviceImagePicker(
                booking[BookingHisotryUserDocumentModel.service])),
          ),
        ),
      ),
    );
  }
}

