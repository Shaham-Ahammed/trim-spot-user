import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_user_side/data/data_provider/user_data_document.dart';
import 'package:trim_spot_user_side/data/firebase_collection_references/user_information_reference.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';

class BookMarkFucntions {
  removeShopFromBookMarked(String shopId, BuildContext context) async {
    final DocumentReference userDocument = CollectionReferences()
        .userCollectionReference()
        .doc(BlocProvider.of<UserDetailsBloc>(context, listen: false).state.id);
    final userDetails = await userDocument.get();
    final List<dynamic> currentBoomarks =
        userDetails[UserDocumentModel.bookmarkedShops];
    currentBoomarks.remove(shopId);
    await userDocument
        .update({UserDocumentModel.bookmarkedShops: currentBoomarks});
  }

  addShopToBookmarkedList(String shopId, BuildContext context) async {
    final DocumentReference userDocument = CollectionReferences()
        .userCollectionReference()
        .doc(BlocProvider.of<UserDetailsBloc>(context, listen: false).state.id);
    final userDetails = await userDocument.get();
    final List<dynamic> currentBoomarks =
        userDetails[UserDocumentModel.bookmarkedShops];
    currentBoomarks.add(shopId);
    await userDocument
        .update({UserDocumentModel.bookmarkedShops: currentBoomarks});
  }

  Future<bool> checkingShopIsBookmarked(String shopId) async {
    final user = await UserDataDocumentFromFirebase().userDocument();
    final List<String> shopIds =
        (user[UserDocumentModel.bookmarkedShops] as List<dynamic>)
            .cast<String>();
    if (shopIds.contains(shopId)) {
      return true;
    } else {
      return false;
    }
  }
}
