import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/slot_selection_bloc/slot_selection_bloc.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/service_booking/slot_tiles_timings.dart';



  Color contianerColor(String time, context) {
    final blocSelectedList =
        BlocProvider.of<SlotSelectionBloc>(context).state.selectedSlots;
    if (booked.contains(time)) {
      return greyColor;
    } else if (blocSelectedList.contains(time)) {
      return cyanColor;
    } else {
      return transparentColor;
    }
  }

  Color textColor(String time, context) {
    final blocSelectedList =
        BlocProvider.of<SlotSelectionBloc>(context).state.selectedSlots;
    if (booked.contains(time)) {
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

  