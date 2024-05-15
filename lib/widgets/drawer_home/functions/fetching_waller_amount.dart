// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_user_side/data/firebase_collection_references/user_information_reference.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/data/repository/firebase_docs_and_collections.dart';

Future<String> fetchingTheWalletAmount(BuildContext context) async {
  final debitedAmountDocs = await CollectionReferences()
      .userCollectionReference()
      .doc(BlocProvider.of<UserDetailsBloc>(
        context,
      ).state.id)
      .collection(FirebaseNamesUserSide.walletcollectionReference)
      .where(WalletUserDocumentModel.credit, isEqualTo: false)
      .get();
  final creditedAmountDocs = await CollectionReferences()
      .userCollectionReference()
      .doc(BlocProvider.of<UserDetailsBloc>(
        context,
      ).state.id)
      .collection(FirebaseNamesUserSide.walletcollectionReference)
      .where(WalletUserDocumentModel.credit, isEqualTo: true)
      .get();

  if (creditedAmountDocs.docs.isEmpty) {
    return "0";
  }

  final creditedAmountList = creditedAmountDocs.docs;
  num credited = 0;
  for (var doc in creditedAmountList) {
    num amount = int.parse(doc[WalletUserDocumentModel.amount]);
    credited += amount;
  }
  if (debitedAmountDocs.docs.isEmpty) {
    return credited.toString();
  }
  num debited = 0;
  final debitedAmountList = debitedAmountDocs.docs;
  for (var doc in debitedAmountList) {
    num amount = int.parse(doc[WalletUserDocumentModel.amount]);
    debited += amount;
  }
  return (credited - debited).toString();
}
