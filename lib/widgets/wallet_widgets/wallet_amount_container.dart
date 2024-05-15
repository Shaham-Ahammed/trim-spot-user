import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/widgets/drawer_home/functions/fetching_waller_amount.dart';

class WalletAmountContainer extends StatelessWidget {
  const WalletAmountContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
          color: greyColor3,
          offset: Offset(0, 0),
          blurRadius: 2,
          spreadRadius: 2,
        )
      ], color: cyanColor, borderRadius: BorderRadius.circular(12)),
      height: mediaqueryHeight(0.07, context),
      width: mediaqueryWidth(0.5, context),
      child: Center(
          child: FutureBuilder<String>(
        future: fetchingTheWalletAmount(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LottieBuilder.asset(
                  "assets/animations/horizontal loading on wallet.json"),
            );
          }
          return myFont("₹${snapshot.data}",
              fontFamily: bebasNeue,
              fontSize: mediaqueryHeight(0.035, context),
              fontWeight: FontWeight.w500,
              fontColor: blackColor);
        },
      )),
    );
  }
}
