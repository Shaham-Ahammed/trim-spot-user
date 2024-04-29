import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

import 'package:trim_spot_user_side/widgets/service_booking_widgets/round_icons_function.dart';

  Positioned fourRoundedIcons(BuildContext context) {
    return Positioned(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: mediaqueryWidth(0.06, context),
                        ),
                        roundIconsBookingScreen(
                          context,
                          icon: Icons.call_outlined,
                          function: () {},
                        ),
                        roundIconsBookingScreen(
                          context,
                          icon: Icons.map_outlined,
                          function: () {},
                        ),
                        roundIconsBookingScreen(
                          context,
                          icon: Icons.message_outlined,
                          function: () {},
                        ),
                        roundIconsBookingScreen(
                          context,
                          icon: Icons.share_outlined,
                          function: () {},
                        ),
                        SizedBox(
                          width: mediaqueryWidth(0.06, context),
                        ),
                      ],
                    ));
  }
