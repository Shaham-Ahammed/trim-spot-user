import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:trim_spot_user_side/blocs/booking_completion_bloc/booking_service_bloc.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/payment_bottomsheet/total_amount_text.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/payment_bottomsheet/upi_container.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/payment_bottomsheet/wallet_container.dart';

displayBottomSheet(BuildContext parentctx, int amount,
    QueryDocumentSnapshot<Object?> shop, Razorpay razorpay) async {
  return showModalBottomSheet(
      builder: (context) {
        return BlocListener<BookingCompletionBloc, BookingCompletionState>(
          listener: (context, state) {
            if (state is StopLoading) {
              Navigator.pop(context);
            }
            if (state is NoEnoughAmountOnWallet) {
              Navigator.pop(context);
              Fluttertoast.showToast(
                msg: "insufficient balance",
                backgroundColor: redErrorColor,
                textColor: whiteColor,
              );
            }
          },
          child: Container(
            height: mediaqueryHeight(0.3, context),
            width: double.infinity,
            decoration: const BoxDecoration(
                color: blackColor,
                border: Border(
                  top: BorderSide(
                    width: 2,
                    color: cyanColor,
                  ),
                ),
                borderRadius: BorderRadius.only(topRight: Radius.circular(90))),
            padding: EdgeInsets.all(mediaqueryHeight(0.02, context)),
            child: Column(
              children: [
                amountPayableText(amount, context),
                SizedBox(
                  height: mediaqueryHeight(0.02, context),
                ),
                walletContainer(context, shop, parentctx, amount),
                SizedBox(
                  height: mediaqueryHeight(0.018, context),
                ),
                upiContainer(amount, razorpay, context)
              ],
            ),
          ),
        );
      },
      context: parentctx);
}

