import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/bookings/alert_texts.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';


Future<dynamic> cannotCancelAlertDialogue(context) {
  return showDialog(
      barrierColor: const Color.fromARGB(182, 0, 0, 0),
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            width: mediaqueryHeight(0.8, context),
            height: mediaqueryHeight(0.3, context),
            padding: EdgeInsets.all(mediaqueryHeight(0.02, context)),
            decoration: BoxDecoration(
              color: blackColor,
              border: Border.all(color: greyColor2, width: 2),
              borderRadius: BorderRadius.circular(
                14,
              ),
            ),
            child: Column(
              children: [
                myFont("OOPS!!",
                    fontFamily: balooChettan,
                    fontSize: mediaqueryHeight(0.0245, context),
                    fontWeight: FontWeight.w600,
                    fontColor: redErrorColor),
                myFont(cannotCancelText,
                    fontFamily: balooChettan,
                    fontSize: mediaqueryHeight(0.02, context),
                    fontWeight: FontWeight.w400,
                    fontColor: greyColor),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(90),
                          color: Colors.blueGrey,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(90),
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                width: mediaqueryWidth(0.2, context),
                                padding: EdgeInsets.symmetric(
                                    vertical: mediaqueryHeight(0.008, context)),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(90),
                                ),
                                child: Center(
                                  child: myFont("SURE",
                                      fontFamily: balooChettan,
                                      fontSize:
                                          mediaqueryHeight(0.018, context),
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
