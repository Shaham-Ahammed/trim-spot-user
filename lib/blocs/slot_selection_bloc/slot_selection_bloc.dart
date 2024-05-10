// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:trim_spot_user_side/blocs/service_booking_blocs/date_selection_bloc/date_selection_bloc.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';

import 'package:trim_spot_user_side/utils/service_booking/total_time.dart';

part 'slot_selection_event.dart';
part 'slot_selection_state.dart';

class SlotSelectionBloc extends Bloc<SlotSelectionEvent, SlotSelectionState> {
  SlotSelectionBloc()
      : super(const SlotSelectionInitial(selectedSlots: [], totalSlots: [])) {
    on<SelectedSlot>(_selectedSlot);
    on<SelectedClearSelection>(_selectedClearSelection);
    on<FetchTotalSlots>(_fetchingTotalSlots);
  }
  _selectedSlot(SelectedSlot event, Emitter<SlotSelectionState> emit) async {
    String dateString =
        BlocProvider.of<DateSelectionBloc>(event.context, listen: false)
            .state
            .formattedDate;

    DateTime today = DateTime.now();
    String todayFormattedDate = DateFormat('EEEE, MMMM dd').format(today);

    bool isToday = (todayFormattedDate == dateString);
    var timesBeforeCurrentTime = [];
    if (isToday) {
      final totalSlots =
          BlocProvider.of<SlotSelectionBloc>(event.context).state.totalSlots;

      DateTime now = DateTime.now();

      String currentTimeString = DateFormat('hh:mm a').format(now);

      DateTime currentTime = DateFormat('hh:mm a').parse(currentTimeString);

      timesBeforeCurrentTime = totalSlots.where((timeString) {
        DateTime time = DateFormat('hh:mm a').parse(timeString);

        return time.isBefore(currentTime);
      }).toList();
    }
    if (timesBeforeCurrentTime.contains(event.time)) {
      return;
    }
    int totalTime = int.parse(totalTimeRequired(event.context));
    int slotsRequired = (totalTime / 30).ceil();
    if (slotsRequired == 0) {
      slotsRequired = 1;
    }
    List<String> slots = [];
    List<String> booked = event.booked;
    if (!booked.contains(event.time)) {
      late int timeIndexInSlots;
      for (var i = 0; i < state.totalSlots.length; i++) {
        if (state.totalSlots[i] == event.time) {
          timeIndexInSlots = i;
          break;
        }
      }

      for (var i = timeIndexInSlots;
          i < timeIndexInSlots + slotsRequired;
          i++) {
        slots.add(state.totalSlots[i]);
      }
      bool flag = true;
      for (var element in slots) {
        if (booked.contains(element)) {
          flag = false;
          break;
        }
      }
      if (flag == true) {
        emit(SlotSelectionInitial(
            selectedSlots: slots, totalSlots: state.totalSlots));
      }
    }
  }

  _selectedClearSelection(
      SelectedClearSelection event, Emitter<SlotSelectionState> emit) {
    final List<String> list = [];
    emit(SlotSelectionInitial(
        selectedSlots: list, totalSlots: state.totalSlots));
  }

  _fetchingTotalSlots(
      FetchTotalSlots event, Emitter<SlotSelectionState> emit) async {
    final data = event.shop;
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

    emit(SlotSelectionInitial(
        selectedSlots: state.selectedSlots, totalSlots: slots));
  }
}
