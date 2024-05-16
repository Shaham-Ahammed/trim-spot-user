import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/data/repository/network_stream.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/no_network.dart';
import 'package:trim_spot_user_side/utils/screen_padding.dart';
import 'package:trim_spot_user_side/widgets/wallet_widgets/headings.dart';
import 'package:trim_spot_user_side/widgets/wallet_widgets/snapshot.dart';
import 'package:trim_spot_user_side/widgets/wallet_widgets/wallet_amount_container.dart';

class MyWalletScreen extends StatelessWidget {
  const MyWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: StreamBuilder<bool>(
          stream: checkInternetconnectivity(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container();
            }

            if (!snapshot.data!) {
              return const NoNetworkDisplayWidget();
            }
            return SafeArea(
                child: Column(
              children: [
                Padding(
                    padding: commonScreenPadding(context),
                    child: Column(
                      children: [
                        const HeadingAndBackButton(),
                        SizedBox(
                          height: mediaqueryHeight(0.03, context),
                        ),
                        const WalletAmountContainer(),
                        SizedBox(
                          height: mediaqueryHeight(0.003, context),
                        ),
                        balanceSubHeading(context),
                        SizedBox(
                          height: mediaqueryHeight(0.03, context),
                        ),
                        const HistoryHeading()
                      ],
                    )),
                SizedBox(
                  height: mediaqueryHeight(0.01, context),
                ),
                const HistoryListView()
              ],
            ));
          }),
    );
  }
}
