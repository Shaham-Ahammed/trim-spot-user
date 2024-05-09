// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/icon_fucntions/map_opening.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/icon_fucntions/message.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/icon_fucntions/phone_dial.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/icon_fucntions/share_details.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/round_icons_function.dart';

Positioned fourRoundedIcons(
    BuildContext context, final QueryDocumentSnapshot<Object?> shop) {
  return Positioned(
      child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      SizedBox(
        width: mediaqueryWidth(0.06, context),
      ),
      roundIconsBookingScreen(
        context,
        icon: Icons.call_outlined,
        function: () {
          launchDialer(shop[SalonDocumentModel.phone]);
        },
      ),
      roundIconsBookingScreen(
        context,
        icon: Icons.map_outlined,
        function: () {
          openMaps(shop[SalonDocumentModel.locationLatLng]);
        },
      ),
      roundIconsBookingScreen(
        context,
        icon: Icons.message_outlined,
        function: () {
          sendMessage(shop[SalonDocumentModel.phone]);
        },
      ),
      roundIconsBookingScreen(
        context,
        icon: Icons.share_outlined,
        function: () {
          shareDetails(shop);
        },
      ),
      SizedBox(
        width: mediaqueryWidth(0.06, context),
      ),
    ],
  ));
}
