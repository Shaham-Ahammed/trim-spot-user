import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/service_booking_blocs/date_selection_bloc/date_selection_bloc.dart';
import 'package:trim_spot_user_side/blocs/service_booking_blocs/service_selected_bloc/service_selected_bloc.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

import 'package:trim_spot_user_side/utils/service_booking/service_available_list.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/resusables.dart';
  BlocBuilder<DateSelectionBloc, DateSelectionState> servicesSection() {
    return BlocBuilder<DateSelectionBloc, DateSelectionState>(
      builder: (context, state) {
        if (state.formattedDate.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: mediaqueryHeight(0.012, context),
              ),
              serviceBookingScreenHeadings(context, "SERVICES"),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    horizontal: mediaqueryWidth(0.03, context),
                    vertical: mediaqueryHeight(0.01, context)),
                decoration: BoxDecoration(
                  color: blackColor,
                  border: Border.all(width: .4, color: cyanColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: serviceAvailableList.length,
                  separatorBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(height: mediaqueryHeight(0.01, context)),
                        Container(
                          height: .5,
                          width: mediaqueryWidth(0.9, context),
                          color: greyColor3,
                        ),
                        SizedBox(
                          height: mediaqueryHeight(0.01, context),
                        )
                      ],
                    );
                  },
                  itemBuilder: (context, index) {
                    final service = serviceAvailableList[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            myFont(service.service,
                                fontFamily: cabinCondensed,
                                fontSize: mediaqueryHeight(0.023, context),
                                fontWeight: FontWeight.w500,
                                fontColor: whiteColor),
                            myFont("₹ ${service.price} - ${service.time} min",
                                fontFamily: cabinCondensed,
                                fontSize: mediaqueryHeight(0.018, context),
                                fontWeight: FontWeight.normal,
                                fontColor: greyColor2)
                          ],
                        ),
                        Transform.scale(
                          scale: .7,
                          child: Switch(
                            value: BlocProvider.of<ServiceSelectedBloc>(context,
                                    listen: true)
                                .state
                                .servicesSelected
                                .contains(service),
                            onChanged: (value) {
                              context
                                  .read<ServiceSelectedBloc>()
                                  .add(SelectedAService(service: service));
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: mediaqueryHeight(0.012, context),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }