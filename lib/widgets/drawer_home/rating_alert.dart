import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:url_launcher/url_launcher.dart';

ratingAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (ctx2) {
      return AlertDialog(
        backgroundColor: greyColor2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        title: Center(
          child: Column(
            children: [
              Text(
                "RATE US",
                style: TextStyle(
                  fontFamily: balooChettan,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: mediaqueryHeight(0.026, context),
                ),
              ),
              Divider(
                  thickness: 2,
                  color: const Color(0xFF555555).withOpacity(0.6)),
            ],
          ),
        ),
      
        titlePadding: EdgeInsets.only(
            top: mediaqueryHeight(0.02, context),
            bottom: mediaqueryHeight(0.01, context),
            left: mediaqueryHeight(0.04, context),
            right: mediaqueryHeight(0.04, context)),

        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                "How would you rate your experience with our app ?",
                style: TextStyle(
                  fontFamily: balooChettan,
                  color: Colors.black,
                  fontSize: mediaqueryHeight(0.021, context),
                ),
              ),
              SizedBox(
                height: mediaqueryHeight(0.013, context),
              ),
              RatingBar.builder(
                itemSize: mediaqueryHeight(0.045, context),
                itemBuilder: (context, _) {
                  return Icon(
                    Icons.star,
                  
                    color: Colors.amber.shade500,
                  );
                },
                onRatingUpdate: (rating) async {
                  Navigator.pop(context);
                  await launchURL();
                },
              )
            ],
          )
        ],
      );
    },
  );
}

Future<void> launchURL() async {
  // ignore: deprecated_member_use
  if (await launch('https://www.amazon.in/dp/B0D571DFTK/ref=apps_sf_sta')) {
    throw "Try Again";
  }
}
