import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';


class ShopLocation extends StatelessWidget {
   final QueryDocumentSnapshot<Object?> shop; 
  const ShopLocation(this.shop,{
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.location_on,
          color: greyColor,
          size: mediaqueryHeight(0.022, context),
        ),
        myFont(shop[SalonDocumentModel.locationName],
            fontFamily: balooChettan,
            fontSize: mediaqueryHeight(0.022, context),
            fontWeight: FontWeight.w500,
            fontColor: greyColor)
      ],
    );
  }
}