import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:trim_spot_user_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_user_side/data/firebase_collection_references/user_information_reference.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/data/repository/firebase_docs_and_collections.dart';
import 'package:trim_spot_user_side/models/wallet_model.dart';

class DbWalletOperations {
  amountDeductionAndWalletUpdation(final QueryDocumentSnapshot<Object?> shop,
      final BuildContext context, final int totalAmount) async {
    final CollectionReference walletreference = CollectionReferences()
        .userCollectionReference()
        .doc(BlocProvider.of<UserDetailsBloc>(context, listen: false).state.id)
        .collection(FirebaseNamesUserSide.walletcollectionReference);

    final String today =
        DateFormat('dd MMM yyyy').format(DateTime.now()).toUpperCase();

    final data = WalletModel(
            shopName: shop[SalonDocumentModel.shopName],
            transferDate: today,
            action: WalletUserDocumentModel.booking,
            amount: totalAmount.toString(),
            credit: false)
        .toMap();
    try {
      await walletreference.add(data);
    } catch (e) {
      print("error");
    }
  }

  refundDuringCancellation(
    final QueryDocumentSnapshot<Object?> bookingHistory,
    final BuildContext context,
  ) async {
    final CollectionReference walletreference = CollectionReferences()
        .userCollectionReference()
        .doc(BlocProvider.of<UserDetailsBloc>(context, listen: false).state.id)
        .collection(FirebaseNamesUserSide.walletcollectionReference);

    final String today =
        DateFormat('dd MMM yyyy').format(DateTime.now()).toUpperCase();

    final data = WalletModel(
            shopName: bookingHistory[BookingHisotryUserDocumentModel.shopName],
            transferDate: today,
            action: WalletUserDocumentModel.refund,
            amount: bookingHistory[BookingHisotryUserDocumentModel.totalAmount],
            credit: true)
        .toMap();
    try {
      await walletreference.add(data);
    } catch (e) {
      print("error $e");
    }
  }
}
