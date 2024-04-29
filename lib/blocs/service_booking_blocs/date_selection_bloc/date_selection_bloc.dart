import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
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
    final DateTime? picked = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: blackColor, // header background color
                onPrimary: cyanColor, // header text color
                onSurface: blackColor, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: blackColor, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        context: event.context,
        initialDate: state.date ?? DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 5)));
    if (picked != null) {
      add(DateSelected(date: picked));
    }
  }

  _dateSelected(DateSelected event, Emitter<DateSelectionState> emit) {
    final String formattedDate = DateFormat('EEEE, MMMM dd').format(event.date);
    emit(DateSelectionInitial(date: event.date, formattedDate: formattedDate));
  }
}
