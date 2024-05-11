import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

Row shopServices(BuildContext context, QueryDocumentSnapshot<Object?> shop) {
  final Map<String, dynamic> servicesMap = shop[SalonDocumentModel.services];
  List<String> services = [];
  servicesMap.forEach(
    (key, value) {
      services.add(key);
    },
  );
  return Row(
    children: [
      Icon(
        Icons.summarize_outlined,
        color: whiteColor,
        size: mediaqueryHeight(0.027, context),
      ),
      SizedBox(
        width: mediaqueryWidth(0.02, context),
      ),
      SizedBox(
          width: mediaqueryWidth(0.55, context),
          child: myFont(services.join(', '),
              fontFamily: balooChettan,
              fontSize: mediaqueryHeight(0.016, context),
              fontWeight: FontWeight.normal,
              fontColor: whiteColor))
    ],
  );
}

Row shopLocation(BuildContext context, String shopLocation) {
  return Row(
    children: [
      Icon(
        Icons.location_on,
        color: whiteColor,
        size: mediaqueryHeight(0.027, context),
      ),
      SizedBox(
        width: mediaqueryWidth(0.02, context),
      ),
      myFont(shopLocation,
          fontFamily: balooChettan,
          fontSize: mediaqueryHeight(0.016, context),
          fontWeight: FontWeight.normal,
          fontColor: whiteColor)
    ],
  );
}

Row shopName(BuildContext context, String shopName) {
  return Row(
    children: [
      Icon(
        Icons.store,
        color: whiteColor,
        size: mediaqueryHeight(0.027, context),
      ),
      SizedBox(
        width: mediaqueryWidth(0.02, context),
      ),
      myFont(shopName.toUpperCase(),
          fontFamily: balooChettan,
          fontSize: mediaqueryHeight(0.016, context),
          fontWeight: FontWeight.w600,
          fontColor: whiteColor)
    ],
  );
}
