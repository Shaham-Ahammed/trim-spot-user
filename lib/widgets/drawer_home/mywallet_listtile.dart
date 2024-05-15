import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trim_spot_user_side/screens/wallet_screen.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/page%20transitions/slide_transition.dart';
import 'package:trim_spot_user_side/widgets/drawer_home/functions/fetching_waller_amount.dart';


class MyWalletSection extends StatelessWidget {
  const MyWalletSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        Navigator.of(context)
            .push(SlideTransitionPageRoute(child: const MyWalletScreen()));
      },
      leading: Icon(
        Icons.wallet_rounded,
        color: greyColor3,
        size: mediaqueryHeight(0.029, context),
      ),
      title: myFont("My Wallet",
          fontFamily: b612,
          fontSize: mediaqueryHeight(0.022, context),
          fontWeight: FontWeight.normal,
          fontColor: whiteColor),
      trailing: FutureBuilder<String>(
          future: fetchingTheWalletAmount(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Shimmer.fromColors(
                baseColor: cyanColor,
                highlightColor: whiteColor,
                child: const Text("..."),
              );
            }
            return myFont("₹${snapshot.data}",
                fontFamily: b612,
                fontSize: mediaqueryHeight(0.018, context),
                fontWeight: FontWeight.normal,
                fontColor: cyanColor);
          }),
    );
  }
}
