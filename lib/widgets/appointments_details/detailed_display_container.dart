import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/models/bookings_model.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

  Container detailsDisplayArea(BuildContext context,BookingsModel bookingModel) {
    return Container(
      decoration: shadowAndColor( bookingModel),
      height: mediaqueryHeight(0.21, context),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          vertical: mediaqueryHeight(0.02, context),
          horizontal: mediaqueryWidth(0.04, context)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          bookingDetailsFunction(
              context, Icons.calendar_month_outlined, bookingModel.date),
          bookingDetailsFunction(
              context, Icons.schedule_rounded, bookingModel.time),
          bookingDetailsFunction(context, Icons.store,
              "${bookingModel.shopName}, ${bookingModel.shopLocation}")
        ],
      ),
    );
  }

  
  BoxDecoration shadowAndColor(BookingsModel bookingModel) {
    return BoxDecoration(
      color: greyColor3,
      boxShadow: [
        BoxShadow(
          color: statusContainerColorSelector(bookingModel.status)
              .withOpacity(0.8), // Shadow color with 50% opacity black
          offset: const Offset(0, 6), // Specify downward shadow
          blurRadius: 8, // Adjust the blur radius for the shadow effect
        ),
      ],
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
Color statusContainerColorSelector(String status) {
  switch (status) {
    case 'pending':
      return const Color.fromRGBO(202, 196, 63, 1);
    case 'cancelled':
      return redErrorColor;
    default:
      return Colors.green.shade700;
  }
}
