import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:slide_to_act_reborn/slide_to_act_reborn.dart';
import 'package:trim_spot_user_side/blocs/slide_to_pay_bloc/slide_to_pay_widget_bloc.dart';
import 'package:trim_spot_user_side/blocs/booking_completion_bloc/booking_service_bloc.dart';
import 'package:trim_spot_user_side/blocs/slot_selection_bloc/slot_selection_bloc.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/functions/total_time.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/functions/payment_function.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/payment_bottomsheet/bottomsheet.dart';

class SlideToPayWidget extends StatefulWidget {
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
        backgroundColor: greenColor,
        textColor: whiteColor,
        msg: "Payment Succesful ${response.paymentId!}",
        toastLength: Toast.LENGTH_SHORT);
    context
        .read<BookingCompletionBloc>()
        .add(BookNowPressed(shop: widget.shop, context: context));
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
                        int.parse(
                          totalAmountOfServices(
                            context,
                          ),
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
                  sliderButtonIcon: Icon(
                    Icons.attach_money,
                    size: mediaqueryHeight(0.03, context),
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
