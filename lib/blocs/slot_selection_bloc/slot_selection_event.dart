part of 'slot_selection_bloc.dart';

@immutable
sealed class SlotSelectionEvent {}

final class SelectedSlot extends SlotSelectionEvent {
  final QueryDocumentSnapshot<Object?> shop;
  final List<String> booked;
  final String time;
  final BuildContext context;
  final int index;
  SelectedSlot(
      {required this.time,
      required this.context,
      required this.index,
      required this.shop,
      required this.booked
      });
}

final class SelectedClearSelection extends SlotSelectionEvent {}

final class FetchTotalSlots extends SlotSelectionEvent {
  final QueryDocumentSnapshot<Object?> shop;

  FetchTotalSlots({required this.shop});
}
