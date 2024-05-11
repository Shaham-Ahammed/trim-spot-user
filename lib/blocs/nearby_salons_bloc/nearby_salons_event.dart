part of 'nearby_salons_bloc.dart';

@immutable
sealed class NearbySalonsEvent {}

final class ViewMorePressed extends NearbySalonsEvent {}

final class FetchingTotalLength extends NearbySalonsEvent {
  final BuildContext context;

  FetchingTotalLength({required this.context});
}
