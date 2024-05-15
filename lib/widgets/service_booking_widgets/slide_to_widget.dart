import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:slide_to_act_reborn/slide_to_act_reborn.dart';
import 'package:trim_spot_user_side/blocs/slide_to_pay_bloc/slide_to_pay_widget_bloc.dart';
import 'package:trim_spot_user_side/blocs/booking_completion_bloc/booking_service_bloc.dart';
import 'package:trim_spot_user_side/blocs/service_booking_blocs/service_selected_bloc/service_selected_bloc.dart';
import 'package:trim_spot_user_side/blocs/slot_selection_bloc/slot_selection_bloc.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/service_booking/total_time.dart';
import 'package:trim_spot_user_side/utils/snack_bars.dart';
import 'package:trim_spot_user_side/widgets/drawer_home/functions/fetching_waller_amount.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/functions/payment_function.dart';

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

  addingDataToFirebaseWhilePressedOnWallet() {
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
    return BlocProvider(
      create: (context) => SlideToPayWidgetBloc(),
      child: BlocBuilder<SlotSelectionBloc, SlotSelectionState>(
        builder: (context, state) {
          if (state.selectedSlots.isNotEmpty &&
              BlocProvider.of<SlideToPayWidgetBloc>(context, listen: true)
                  .state
                  .notSwiped) {
            return Column(
              children: [
                SizedBox(
                  height: mediaqueryHeight(0.02, context),
                ),
                SlideAction(
                  animationDuration: const Duration(milliseconds: 100),
                  onSubmit: () {
                    displayBottomSheet(
                        context,
                        totalAmountForService(
                          context,
                        ),
                        widget.shop,
                        razorpay);
                    context
                        .read<SlideToPayWidgetBloc>()
                        .add(SwipedThePayment());
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
      ),
    );
  }
}

int totalAmountForService(BuildContext context) {
  int totalAmount = 0;
  BlocProvider.of<ServiceSelectedBloc>(context)
      .state
      .serviceMap
      .forEach((key, value) {
    if (value.containsKey(SalonDocumentModel.serviceRate)) {
      int timeForAService = int.parse(value[SalonDocumentModel.serviceRate]!);
      totalAmount += timeForAService;
    }
  });
  return totalAmount;
}

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
                myFont("PAY ₹$amount",
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
                    onTap: () {
                      context.read<BookingCompletionBloc>().add(
                          WalletSelectedForPayment(
                              shop: shop,
                              context: parentctx,
                              totalAmount: amount));
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
                          FutureBuilder<String>(
                            future: fetchingTheWalletAmount(context),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return LottieBuilder.asset(
                                  "assets/animations/loading_indicator_wallet.json",
                                  height: mediaqueryHeight(0.05, context),
                                );
                              }
                              return myFont("₹${snapshot.data}",
                                  fontFamily: balooChettan,
                                  fontSize: mediaqueryHeight(0.025, context),
                                  fontWeight: FontWeight.w400,
                                  fontColor: whiteColor);
                            },
                          )
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
                )
              ],
            ),
          ),
        );
      },
      context: parentctx);
}
