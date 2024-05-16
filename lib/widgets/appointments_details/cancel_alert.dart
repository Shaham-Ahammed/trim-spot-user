import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/cancel_booking_bloc/cancel_booking_bloc_bloc.dart';
import 'package:trim_spot_user_side/utils/bookings/alert_texts.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

Future<dynamic> cancelAlertDialogue(
    context, final QueryDocumentSnapshot<Object?> bookingDetails) {
  return showDialog(
      barrierColor: const Color.fromARGB(182, 0, 0, 0),
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            width: mediaqueryHeight(0.8, context),
            height: mediaqueryHeight(0.23, context),
            padding: EdgeInsets.all(mediaqueryHeight(0.02, context)),
            decoration: BoxDecoration(
              color: blackColor,
              border: Border.all(color: cyanColor, width: 2),
              borderRadius: BorderRadius.circular(
                14,
              ),
            ),
            child: Column(
              children: [
                myFont("Confirm Cancellation ?",
                    fontFamily: balooChettan,
                    fontSize: mediaqueryHeight(0.0245, context),
                    fontWeight: FontWeight.w500,
                    fontColor: whiteColor),

                    
                    SizedBox(height:mediaqueryHeight(0.003, context)),
             
               
                myFont(
                  refundAlertText  ,
                    fontFamily: balooChettan,
                    fontSize: mediaqueryHeight(0.016, context),
                    fontWeight: FontWeight.w400,
                    fontColor: greyColor),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(90),
                          color: greyColor2,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(90),
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                width: mediaqueryWidth(0.24, context),
                                padding: EdgeInsets.symmetric(
                                    vertical: mediaqueryHeight(0.008, context)),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(90),
                                ),
                                child: Center(
                                  child: myFont("No",
                                      fontFamily: balooChettan,
                                      fontSize:
                                          mediaqueryHeight(0.022, context),
                                      fontWeight: FontWeight.w600,
                                      fontColor: blackColor),
                                )),
                          ),
                        )),
                    Container(
                      height: mediaqueryHeight(0.03, context),
                      width: 1,
                      color: greyColor3,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(90),
                          color: redErrorColor,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(90),
                            onTap: () {
                              context.read<CancelBookingBloc>().add(
                                  PressedYesOnCancelBooking(
                                      bookingDetails: bookingDetails,
                                      context: context));
                            },
                            child: Container(
                                width: mediaqueryWidth(0.24, context),
                                padding: EdgeInsets.symmetric(
                                    vertical: mediaqueryHeight(0.008, context)),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(90),
                                ),
                                child: Center(
                                  child: myFont("Yes",
                                      fontFamily: balooChettan,
                                      fontSize:
                                          mediaqueryHeight(0.022, context),
                                      fontWeight: FontWeight.w600,
                                      fontColor: whiteColor),
                                )),
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: mediaqueryHeight(0.015, context),
                )
              ],
            ),
          ),
        );
      });
}
