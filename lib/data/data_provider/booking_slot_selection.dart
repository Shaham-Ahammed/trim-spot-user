import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:trim_spot_user_side/blocs/service_booking_blocs/date_selection_bloc/date_selection_bloc.dart';
import 'package:trim_spot_user_side/blocs/slot_selection_bloc/slot_selection_bloc.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';

import 'package:trim_spot_user_side/widgets/service_booking_widgets/functions/total_time.dart';

class SlotSelectionForBooking {
  List<String> selectedBookingSlots(
      {required BuildContext context,
      required final int index,
      required final String time,
      required List<String> booked,
      required List<String> totalSlots}) {
    String dateString =
        BlocProvider.of<DateSelectionBloc>(context, listen: false)
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
    if (timesBeforeCurrentTime.contains(time)) {
      return [];
    }
    int totalTime = int.parse(totalTimeRequired(context));
    int slotsRequired = (totalTime / 30).ceil();
    if (slotsRequired == 0) {
      slotsRequired = 1;
    }
    List<String> slots = [];

    if (!booked.contains(time)) {
      late int timeIndexInSlots;
      for (var i = 0; i < totalSlots.length; i++) {
        if (totalSlots[i] == time) {
          timeIndexInSlots = i;
          break;
        }
      }

      for (var i = timeIndexInSlots;
          i < timeIndexInSlots + slotsRequired;
          i++) {
        slots.add(totalSlots[i]);
      }
    }
    return slots;
  }

 List<String> fetchingTotalSlots(final QueryDocumentSnapshot<Object?> shop) {
    final data = shop;
    final String openingTime = data[SalonDocumentModel.parsedOpeningTime];
    final String closingTime = data[SalonDocumentModel.parsedClosingTime];

    DateFormat format = DateFormat('hh:mm a');
    DateTime opening = format.parse(openingTime);
    DateTime closing = format.parse(closingTime);

    List<String> slots = [];

    for (var i = opening;
        i.isBefore(closing);
        i = i.add(const Duration(minutes: 30))) {
      slots.add(format.format(i));
    }
    return slots;
  }
}
