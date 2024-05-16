import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:trim_spot_user_side/blocs/booking_completion_bloc/booking_service_bloc.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/widgets/drawer_home/functions/fetching_waller_amount.dart';

Material walletContainer(BuildContext context, QueryDocumentSnapshot<Object?> shop, BuildContext parentctx, int amount) {
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
              );
}