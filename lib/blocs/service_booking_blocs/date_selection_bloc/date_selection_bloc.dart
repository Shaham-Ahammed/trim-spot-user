import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:trim_spot_user_side/data/data_provider/booking_date_selection.dart';
part 'date_selection_event.dart';
part 'date_selection_state.dart';

class DateSelectionBloc extends Bloc<DateSelectionEvent, DateSelectionState> {
  DateSelectionBloc()
      : super(const DateSelectionInitial(date: null, formattedDate: "")) {
    on<DatePickerPressed>(_datePickerPressed);
    on<DateSelected>(_dateSelected);
  }
  _datePickerPressed(
      DatePickerPressed event, Emitter<DateSelectionState> emit) async {
    final DateTime? picked =
        await DateSelectionForBooking().pickingADate(event.context, event.shop);
    if (picked != null) {
      add(DateSelected(date: picked));
    }
  }

  _dateSelected(DateSelected event, Emitter<DateSelectionState> emit) {
    final String formattedDate = DateFormat('EEEE, MMMM dd').format(event.date);
    emit(DateSelectionInitial(date: event.date, formattedDate: formattedDate));
  }
}
