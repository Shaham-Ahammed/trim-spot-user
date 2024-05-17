// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/data/data_provider/booking_slot_selection.dart';


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
    List<String> booked = event.booked;

    final List<String> slots = SlotSelectionForBooking().selectedBookingSlots(
        context: event.context,
        index: event.index,
        time: event.time,
        booked: booked,
        totalSlots: state.totalSlots);

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

  _selectedClearSelection(
      SelectedClearSelection event, Emitter<SlotSelectionState> emit) {
    final List<String> list = [];

    emit(SlotSelectionInitial(
        selectedSlots: list, totalSlots: state.totalSlots));
  }

  _fetchingTotalSlots(
      FetchTotalSlots event, Emitter<SlotSelectionState> emit) async {

    final List<String> slots =
        SlotSelectionForBooking().fetchingTotalSlots(event.shop);

    emit(SlotSelectionInitial(
        selectedSlots: state.selectedSlots, totalSlots: slots));
  }
}
