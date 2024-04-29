part of 'slot_selection_bloc.dart';

@immutable
sealed class SlotSelectionState {
  final List<String> selectedSlots;

  const SlotSelectionState({required this.selectedSlots});
}

final class SlotSelectionInitial extends SlotSelectionState {
  const SlotSelectionInitial({required super.selectedSlots});
}
