import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

  amount(QueryDocumentSnapshot<Object?> walletHistory, BuildContext context) {
  return  myFont(
                              walletHistory[WalletUserDocumentModel
                                          .action] ==
                                      WalletUserDocumentModel.booking
                                  ? '- ₹${walletHistory[WalletUserDocumentModel.amount]}'
                                  : '+ ₹${walletHistory[WalletUserDocumentModel.amount]}',
                              fontFamily: balooChettan,
                              fontSize:
                                  mediaqueryHeight(0.022, context),
                              fontWeight: FontWeight.w600,
                              fontColor: walletHistory[
                                          WalletUserDocumentModel
                                              .action] ==
                                      WalletUserDocumentModel.booking
                                  ? redErrorColor
                                  : greenColor);
  }

  transferDate(QueryDocumentSnapshot<Object?> walletHistory, BuildContext context) {
   return myFont(
                                  walletHistory[WalletUserDocumentModel
                                      .transferDate],
                                  fontFamily: balooChettan,
                                  fontSize:
                                      mediaqueryHeight(0.016, context),
                                  fontWeight: FontWeight.w500,
                                  fontColor: greyColor3);
  }

  shopName(QueryDocumentSnapshot<Object?> walletHistory, BuildContext context) {
  return  myFont(
                                  walletHistory[
                                      WalletUserDocumentModel.shopName],
                                  fontFamily: balooChettan,
                                  fontSize:
                                      mediaqueryHeight(0.023, context),
                                  fontWeight: FontWeight.w500,
                                  fontColor: greyColor2);
  }


class BookingOrRefund extends StatelessWidget {
  const BookingOrRefund({
    super.key,
    required this.walletHistory,
  });

  final QueryDocumentSnapshot<Object?> walletHistory;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: mediaqueryWidth(0.23, context),
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(90),
            color: whiteColor,
            border: Border.all(
                width: 2,
                color: walletHistory[
                            WalletUserDocumentModel
                                .action] ==
                        WalletUserDocumentModel
                            .booking
                    ? redErrorColor
                    : greenColor)),
        padding: EdgeInsets.symmetric(
            // vertical: mediaqueryHeight(0.005, context),
            horizontal: mediaqueryWidth(
                0.02, context)),
        child: Center(
          child: myFont(
              walletHistory[
                  WalletUserDocumentModel
                      .action],
              fontFamily: balooChettan,
              fontSize: mediaqueryHeight(
                  0.018, context),
              fontWeight: FontWeight.w500,
              fontColor: walletHistory[
                          WalletUserDocumentModel
                              .action] ==
                      WalletUserDocumentModel
                          .booking
                  ? redErrorColor
                  : greenColor),
        ));
  }
}

