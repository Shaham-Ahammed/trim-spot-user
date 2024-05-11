part of 'nearby_salons_bloc.dart';

@immutable
sealed class NearbySalonsState {
  final int listCount;
  final int originalLength;

 const NearbySalonsState({required this.listCount, required this.originalLength});
}

final class NearbySalonsInitial extends NearbySalonsState {
 const NearbySalonsInitial(
      {required super.listCount, required super.originalLength});
}
