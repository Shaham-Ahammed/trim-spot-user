part of 'slot_selection_bloc.dart';

@immutable
sealed class SlotSelectionEvent {}

final class SelectedSlot extends SlotSelectionEvent {
  final String time;
  final BuildContext context;
  final int index;
  SelectedSlot({
    required this.time,
    required this.context,
    required this.index
  });

  
}
final class SelectedClearSelection extends SlotSelectionEvent{

  }