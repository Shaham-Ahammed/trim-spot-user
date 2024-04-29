import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/models/bookings_model.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class BookingsImage extends StatelessWidget {
  const BookingsImage({
    super.key,
    required this.myBookings,
  });

  final BookingsModel myBookings;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: myBookings.date+myBookings.time,
      child: Container(
        width: mediaqueryWidth(0.2, context),
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(myBookings.serviceImage),
          ),
        ),
      ),
    );
  }
}
