import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:slide_to_act_reborn/slide_to_act_reborn.dart';
import 'package:trim_spot_user_side/blocs/booking_completion_bloc/booking_service_bloc.dart';
import 'package:trim_spot_user_side/blocs/slot_selection_bloc/slot_selection_bloc.dart';

import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class SlideToPayWidget extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> shop;
  const SlideToPayWidget(this.shop,{
    super.key,
  });

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
                onSubmit: () {
                  context
                      .read<BookingCompletionBloc>()
                      .add(BookNowPressed(shop: shop, context: context));
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
