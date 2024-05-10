import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/service_booking_blocs/service_selected_bloc/service_selected_bloc.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

import 'package:trim_spot_user_side/widgets/service_booking_widgets/resusables.dart';

class TotalTime extends StatelessWidget {
  const TotalTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        myFont("TOTAL TIME",
            fontFamily: belleza,
            fontSize: mediaqueryHeight(0.018, context),
            fontWeight: FontWeight.w500,
            fontColor: greyColor2),
        SizedBox(
          height: mediaqueryHeight(0.008, context),
        ),
        Container(
            padding: containerPaddingServiceBooking(context),
            width: mediaqueryWidth(0.3, context),
            height: mediaqueryHeight(0.05, context),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: greyColor3,
                border: Border.all(color: greyColor, width: .4)),
            child: Align(
              alignment: Alignment.center,
              child: BlocBuilder<ServiceSelectedBloc, ServiceSelectedState>(
                builder: (context, state) {
                  int time = 0;
                  state.serviceMap.forEach((key, value) {
                    if (value.containsKey(SalonDocumentModel.serviceTime)) {
                      int timeForAService =
                          int.parse(value[SalonDocumentModel.serviceTime]!);
                      time += timeForAService;
                    }
                  });
                  return Text(
                    "$time min",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        overflow: null,
                        fontFamily: cabinCondensed,
                        fontSize: mediaqueryHeight(0.023, context),
                        fontWeight: FontWeight.w500,
                        color: whiteColor),
                  );
                },
              ),
            )),
      ],
    );
  }
}
