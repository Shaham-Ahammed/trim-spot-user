import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/service_booking_blocs/date_selection_bloc/date_selection_bloc.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

import 'package:trim_spot_user_side/widgets/service_booking_widgets/resusables.dart';

  BlocBuilder<DateSelectionBloc, DateSelectionState>
      dateSelectionContaienerField() {
    return BlocBuilder<DateSelectionBloc, DateSelectionState>(
      builder: (context, state) {
        return Material(
          borderRadius: BorderRadius.circular(10),
          color: blackColor,
          child: InkWell(
            onTap: () {
              context
                  .read<DateSelectionBloc>()
                  .add(DatePickerPressed(context: context));
            },
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: double.infinity,
              height: mediaqueryHeight(0.06, context),
              decoration: containerBoxDecoration(),
              padding: containerPaddingServiceBooking(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    state.date != null ? state.formattedDate : "Select Date",
                    style: TextStyle(
                      fontFamily: cabinCondensed,
                      fontSize: mediaqueryHeight(0.023, context),
                      fontWeight: FontWeight.w500,
                      color: whiteColor,
                    ),
                  ),
                  const Icon(
                    Icons.calendar_today_outlined,
                    color: whiteColor,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
