import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trim_spot_user_side/data/data_provider/user_data_document.dart';
import 'package:trim_spot_user_side/data/firebase_collection_references/user_information_reference.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';

Future<List<QueryDocumentSnapshot>> fetchBookmarkedShops(
    BuildContext context) async {
  List<QueryDocumentSnapshot> bookMarkedShops = [];

  final user = await UserDataDocumentFromFirebase().userDocument();
  final List<String> shopIds =
      (user[UserDocumentModel.bookmarkedShops] as List<dynamic>).cast<String>();
  final allShopDetailsData =
      await CollectionReferences().shopDetailsReference().get();

  for (var doc in allShopDetailsData.docs) {
    if (shopIds.contains(doc.id)) {
      bookMarkedShops.add(doc);
    }
  }
  return bookMarkedShops;
}
