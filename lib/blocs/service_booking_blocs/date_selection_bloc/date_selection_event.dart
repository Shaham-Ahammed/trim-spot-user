part of 'date_selection_bloc.dart';

@immutable
sealed class DateSelectionEvent {}

final class DatePickerPressed extends DateSelectionEvent {
  final BuildContext context;

  DatePickerPressed({required this.context});
}

final class DateSelected extends DateSelectionEvent {
  final DateTime date;

  DateSelected({required this.date});
}
