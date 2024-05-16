import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/data/repository/network_stream.dart';

import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/no_network.dart';
import 'package:trim_spot_user_side/utils/screen_padding.dart';
import 'package:trim_spot_user_side/widgets/appointments/heading.dart';
import 'package:trim_spot_user_side/widgets/appointments/listview.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

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
                  bookingsScreenHeading(context),
                  SizedBox(
                    height: mediaqueryHeight(0.025, context),
                  ),
                  const Expanded(child: AllAppointmentsList())
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
