part of 'nearby_salons_bloc.dart';

@immutable
sealed class NearbySalonsState {
  final int listCount;

  const NearbySalonsState({required this.listCount});
}

final class NearbySalonsInitial extends NearbySalonsState {
  const NearbySalonsInitial({required super.listCount});
}
