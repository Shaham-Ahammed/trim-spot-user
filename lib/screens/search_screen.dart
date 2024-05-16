import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/data/repository/network_stream.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/no_network.dart';
import 'package:trim_spot_user_side/utils/screen_padding.dart';
import 'package:trim_spot_user_side/widgets/search_widgets/heading.dart';
import 'package:trim_spot_user_side/widgets/search_widgets/search_contianer.dart';
import 'package:trim_spot_user_side/widgets/search_widgets/search_result_builder.dart';

class SearchScreen extends StatelessWidget {
  final String service;
  final bool autoFocus;
  final bool backButtonNeeded;
  const SearchScreen({super.key, this.autoFocus = false, this.service = "",this.backButtonNeeded=false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: StreamBuilder<bool>(
           stream: checkInternetconnectivity(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container();
                    }

                    if (!snapshot.data!) {
                     

                     return const  NoNetworkDisplayWidget();
                    }
            return Padding(
              padding: commonScreenPadding(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (backButtonNeeded == true)
                    const BackButtonWithHeading()
                  else
                    searchHeading(context),
                  SizedBox(
                    height: mediaqueryHeight(0.016, context),
                  ),
                  SearchField(
                    autoFocus: autoFocus,
                    service: service,
                  ),
                  SizedBox(
                    height: mediaqueryHeight(0.03, context),
                  ),
                  const ListViewOfSearchScreen()
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
