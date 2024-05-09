import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

 AppBar reviewsAndRatingsAppBar(BuildContext context,shop) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: greyColor2,
          )),
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: const Color.fromARGB(179, 60, 60, 60),
      title: myFont(shop[SalonDocumentModel.shopName],
          fontFamily: cabinCondensed,
          fontSize: mediaqueryHeight(0.03, context),
          fontWeight: FontWeight.w600,
          fontColor: greyColor2),
    );
  }