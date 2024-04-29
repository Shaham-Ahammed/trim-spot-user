import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

  shopName(BuildContext context,  QueryDocumentSnapshot<Object?> shop ) {
   return myFont(shop[SalonDocumentModel.shopName],
        fontFamily: balooChettan,
        fontSize: mediaqueryHeight(0.028, context),
        fontWeight: FontWeight.w600,
        fontColor: greyColor);
  }