import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:slide_to_act_reborn/slide_to_act_reborn.dart';
import 'package:trim_spot_user_side/blocs/booking_completion_bloc/booking_service_bloc.dart';
import 'package:trim_spot_user_side/blocs/slot_selection_bloc/slot_selection_bloc.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class SlideToPayWidget extends StatefulWidget {
  // final Razorpay razorpay;
  final QueryDocumentSnapshot<Object?> shop;
  const SlideToPayWidget({
    super.key,
    required this.shop,
  });

  @override
  State<SlideToPayWidget> createState() => _SlideToPayWidgetState();
}

class _SlideToPayWidgetState extends State<SlideToPayWidget> {
  late Razorpay razorpay;

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Succesful${response.paymentId!}",
        toastLength: Toast.LENGTH_SHORT);
    context
        .read<BookingCompletionBloc>()
        .add(BookNowPressed(shop: widget.shop, context: context));
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Fail${response.message!}",
        toastLength: Toast.LENGTH_SHORT);
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "External wallet${response.walletName!}",
        toastLength: Toast.LENGTH_SHORT);
  }

  @override
  void initState() {
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlotSelectionBloc, SlotSelectionState>(
      builder: (context, state) {
        if (state.selectedSlots.isNotEmpty) {
          return Column(
            children: [
              SizedBox(
                height: mediaqueryHeight(0.02, context),
              ),
              SlideAction(
                animationDuration: const Duration(milliseconds: 100),
                onSubmit: () {
                  displayBottomSheet(context);

                  // openCheckout(100, razorpay);
                },
                borderRadius: 90,
                height: mediaqueryHeight(0.082, context),
                innerColor: cyanColor,
                outerColor: Colors.white30,
                sliderButtonIcon: const Icon(
                  Icons.attach_money,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: mediaqueryWidth(0.16, context),
                    ),
                    myFont("proceed to payment",
                        fontFamily: balooChettan,
                        fontSize: mediaqueryHeight(0.023, context),
                        fontWeight: FontWeight.normal,
                        fontColor: whiteColor),
                    LottieBuilder.asset(
                      "assets/animations/swipe_to_pay_animation.json",
                      height: mediaqueryHeight(0.034, context),
                    )
                  ],
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}

displayBottomSheet(context) async {
  return showModalBottomSheet(
      builder: (context) {
        return Container(
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
              myFont("PAY ₹870",
                  fontFamily: b612,
                  fontSize: mediaqueryHeight(0.023, context),
                  fontWeight: FontWeight.w500,
                  fontColor: whiteColor),
              SizedBox(
                height: mediaqueryHeight(0.02, context),
              ),
              Material(
                color: blackColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                ),
                child: InkWell(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                  ),
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                        ),
                        border: Border.all(width: 2, color: cyanColor)),
                    padding: EdgeInsets.symmetric(
                        vertical: mediaqueryHeight(0.02, context),
                        horizontal: mediaqueryWidth(0.03, context)),
                    width: double.infinity,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.wallet,
                          color: whiteColor,
                        ),
                        SizedBox(
                          width: mediaqueryWidth(0.03, context),
                        ),
                        myFont("Wallet",
                            fontFamily: balooChettan,
                            fontSize: mediaqueryHeight(0.025, context),
                            fontWeight: FontWeight.w400,
                            fontColor: whiteColor),
                        const Spacer(),
                        myFont("₹100",
                            fontFamily: balooChettan,
                            fontSize: mediaqueryHeight(0.025, context),
                            fontWeight: FontWeight.w400,
                            fontColor: whiteColor)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: mediaqueryHeight(0.018, context),
              ),
              Material(
                color: blackColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                ),
                child: InkWell(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                  ),
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                        ),
                        border: Border.all(width: 2, color: cyanColor)),
                    padding: EdgeInsets.symmetric(
                        vertical: mediaqueryHeight(0.02, context),
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
              )
            ],
          ),
        );
      },
      context: context);
}
