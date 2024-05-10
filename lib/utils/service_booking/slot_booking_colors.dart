import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:trim_spot_user_side/blocs/service_booking_blocs/date_selection_bloc/date_selection_bloc.dart';
import 'package:trim_spot_user_side/blocs/slot_selection_bloc/slot_selection_bloc.dart';
import 'package:trim_spot_user_side/utils/colors.dart';

class SlotColorsInBookingScreen {
  Color contianerColor(String time, context, List<String> list) {
    final blocSelectedList =
        BlocProvider.of<SlotSelectionBloc>(context).state.selectedSlots;

    String dateString =
        BlocProvider.of<DateSelectionBloc>(context, listen: true)
            .state
            .formattedDate;

    DateTime today = DateTime.now();
    String todayFormattedDate = DateFormat('EEEE, MMMM dd').format(today);

    bool isToday = (todayFormattedDate == dateString);
    var timesBeforeCurrentTime = [];
    if (isToday) {
      final totalSlots =
          BlocProvider.of<SlotSelectionBloc>(context).state.totalSlots;

      DateTime now = DateTime.now();

      String currentTimeString = DateFormat('hh:mm a').format(now);

      DateTime currentTime = DateFormat('hh:mm a').parse(currentTimeString);

      timesBeforeCurrentTime = totalSlots.where((timeString) {
        DateTime time = DateFormat('hh:mm a').parse(timeString);

        return time.isBefore(currentTime);
      }).toList();
    }

    if (list.contains(time) || timesBeforeCurrentTime.contains(time)) {
      return greyColor;
    } else if (blocSelectedList.contains(time)) {
      return cyanColor;
    } else {
      return transparentColor;
    }
  }

  Color textColor(String time, context, list) {
    final blocSelectedList =
        BlocProvider.of<SlotSelectionBloc>(context).state.selectedSlots;

    String dateString =
        BlocProvider.of<DateSelectionBloc>(context, listen: true)
            .state
            .formattedDate;

    DateTime today = DateTime.now();
    String todayFormattedDate = DateFormat('EEEE, MMMM dd').format(today);

    bool isToday = (todayFormattedDate == dateString);
    var timesBeforeCurrentTime = [];
    if (isToday) {
      final totalSlots =
          BlocProvider.of<SlotSelectionBloc>(context).state.totalSlots;

      DateTime now = DateTime.now();

      String currentTimeString = DateFormat('hh:mm a').format(now);

      DateTime currentTime = DateFormat('hh:mm a').parse(currentTimeString);

      timesBeforeCurrentTime = totalSlots.where((timeString) {
        DateTime time = DateFormat('hh:mm a').parse(timeString);

        return time.isBefore(currentTime);
      }).toList();
    }

    if (list.contains(time) || timesBeforeCurrentTime.contains(time)) {
      return Colors.grey.shade800;
    } else if (blocSelectedList.contains(time)) {
      return blackColor;
    } else {
      return whiteColor;
    }
  }

  Color borderColor(String time, context) {
    final blocSelectedList =
        BlocProvider.of<SlotSelectionBloc>(context).state.selectedSlots;
    if (blocSelectedList.contains(time)) {
      return cyanColor;
    } else {
      return Colors.white60;
    }
  }
}
