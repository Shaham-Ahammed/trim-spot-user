import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trim_spot_user_side/utils/colors.dart';

void openCheckout(amount, Razorpay razorpay) async {
  amount = amount * 100;
  var options = {
    'key': "rzp_test_1ZaIg0DsDh8UDl",
    'amount': amount,
    'name': 'Trim Spot',
    'prefill': {'contact': '9961628586', 'email': 'shahamshaaz7@gmail.com'},
    'external': {
      'wallets': ['paytm']
    }
  };
  try {
    razorpay.open(options);
  } catch (e) {
    debugPrint("error in payment :$e");
  }
}


 

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
       backgroundColor: redErrorColor,
        msg: "Payment Fail${response.message!}",
        toastLength: Toast.LENGTH_SHORT);
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "External wallet${response.walletName!}",
        toastLength: Toast.LENGTH_SHORT);
  }