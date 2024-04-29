part of 'service_selected_bloc.dart';

@immutable
sealed class ServiceSelectedEvent {}

final class SelectedAService extends ServiceSelectedEvent {
  final ServicesAvailableModel service;

  SelectedAService({required this.service});
}
