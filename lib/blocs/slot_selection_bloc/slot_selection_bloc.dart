// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:trim_spot_user_side/utils/service_booking/slot_tiles_timings.dart';
import 'package:trim_spot_user_side/utils/service_booking/total_time.dart';

part 'slot_selection_event.dart';
part 'slot_selection_state.dart';

class SlotSelectionBloc extends Bloc<SlotSelectionEvent, SlotSelectionState> {
  SlotSelectionBloc() : super(const SlotSelectionInitial(selectedSlots: [])) {
    on<SelectedSlot>(_selectedSlot);
    on<SelectedClearSelection>(_selectedClearSelection);
  }
  _selectedSlot(SelectedSlot event, Emitter<SlotSelectionState> emit) {
    int totalTime = int.parse(totalTimeRequired(event.context));
    int slotsRequired = (totalTime ~/ 30).ceil();
    print(slotsRequired);
    List<String> slots = [];
    if (!booked.contains(event.time)) {
      late int timeIndexInSlots;
      for (var i = 0; i < timeSlots.length; i++) {
        if (timeSlots[i] == event.time) {
          timeIndexInSlots = i;
          break;
        }
      }

      for (var i = timeIndexInSlots;
          i < timeIndexInSlots + slotsRequired;
          i++) {
        slots.add(timeSlots[i]);
      }
      bool flag = true;
      for (var element in slots) {
        if (booked.contains(element)) {
          flag = false;
          break;
        }
      }
      if (flag == true) {
        emit(SlotSelectionInitial(selectedSlots: slots));
      }
    }
  }

  _selectedClearSelection(
      SelectedClearSelection event, Emitter<SlotSelectionState> emit) {
    final List<String> list = [];
    emit(SlotSelectionInitial(selectedSlots: list));
  }
}
