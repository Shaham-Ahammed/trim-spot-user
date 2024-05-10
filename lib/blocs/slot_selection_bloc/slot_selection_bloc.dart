// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
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
    int totalTime = int.parse(totalTimeRequired(event.context));
    int slotsRequired = (totalTime ~/ 30).ceil();
    print(slotsRequired);
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
