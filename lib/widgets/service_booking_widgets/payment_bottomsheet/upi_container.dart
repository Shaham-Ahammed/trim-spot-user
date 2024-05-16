import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/functions/payment_function.dart';

Material upiContainer(int amount, Razorpay razorpay, BuildContext context) {
  return Material(
                color: blackColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                ),
                child: InkWell(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                  ),
                  onTap: () {
                    openCheckout(amount, razorpay);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                        ),
                        border: Border.all(width: 2, color: cyanColor)),
                    padding: EdgeInsets.symmetric(
                        vertical: mediaqueryHeight(0.015, context),
                        horizontal: mediaqueryWidth(0.03, context)),
                    width: double.infinity,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.language_outlined,
                          color: whiteColor,
                        ),
                        SizedBox(
                          width: mediaqueryWidth(0.03, context),
                        ),
                        myFont("UPI",
                            fontFamily: balooChettan,
                            fontSize: mediaqueryHeight(0.025, context),
                            fontWeight: FontWeight.w400,
                            fontColor: whiteColor),
                      ],
                    ),
                  ),
                ),
              );
}
