import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class ShopImageDisplay extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> shop;
  const ShopImageDisplay(
    this.shop, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(25)),
      child: Image.network(
        shop[SalonDocumentModel.shopImage],
        fit: BoxFit.cover,
        height: mediaqueryHeight(0.28, context),
        width: double.infinity,
      ),
    );
  }
}
