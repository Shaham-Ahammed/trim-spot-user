import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

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
