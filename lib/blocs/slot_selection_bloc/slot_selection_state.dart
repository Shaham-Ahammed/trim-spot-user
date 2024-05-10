part of 'slot_selection_bloc.dart';

@immutable
sealed class SlotSelectionState {
  final List<String> selectedSlots;
  final List<String> totalSlots;

  const SlotSelectionState({required this.selectedSlots, required this.totalSlots});
}

final class SlotSelectionInitial extends SlotSelectionState {
  const SlotSelectionInitial(
      {required super.selectedSlots, required super.totalSlots});
}
