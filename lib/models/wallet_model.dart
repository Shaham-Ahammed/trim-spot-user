import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WalletModel {
  final String shopName;
  final String transferDate;
  final String action;
  final String amount;
  final bool credit;
  final Timestamp timeStamp;

  WalletModel(
      {required this.shopName,
      required this.transferDate,
      required this.action,
      required this.amount,
      required this.timeStamp,
      required this.credit});

  Map<String, dynamic> toMap() {
    return {
      WalletUserDocumentModel.timeStamp :timeStamp,
      WalletUserDocumentModel.amount: amount,
      WalletUserDocumentModel.credit: credit,
      WalletUserDocumentModel.shopName: shopName,
      WalletUserDocumentModel.transferDate: transferDate,
      WalletUserDocumentModel.action: action
    };
  }
}
