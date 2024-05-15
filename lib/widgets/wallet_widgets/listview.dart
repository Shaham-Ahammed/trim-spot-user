import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/widgets/wallet_widgets/listtile_items.dart';

  Expanded listViewOfHistory(AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
    return Expanded(
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final walletHistory = snapshot.data!.docs[index];
                    return Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 36, 36, 36),
                          boxShadow: [
                            BoxShadow(
                                color: whiteColor,
                                offset: Offset(0, 3),
                                blurRadius: 3)
                          ]),
                      padding: EdgeInsets.symmetric(
                          horizontal: mediaqueryWidth(0.04, context),
                          vertical: mediaqueryHeight(0.015, context)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              shopName(walletHistory, context),
                              transferDate(walletHistory, context),
                              const SizedBox(
                                height: 3,
                              ),
                              BookingOrRefund(walletHistory: walletHistory)
                            ],
                          ),
                          amount(walletHistory, context),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: mediaqueryHeight(0.013, context),
                    );
                  },
                  itemCount: snapshot.data!.docs.length));
  }

