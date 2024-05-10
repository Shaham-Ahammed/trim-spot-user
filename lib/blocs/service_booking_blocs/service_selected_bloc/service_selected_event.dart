part of 'service_selected_bloc.dart';

@immutable
sealed class ServiceSelectedEvent {}

final class SelectedAService extends ServiceSelectedEvent {
  final String service;
  final QueryDocumentSnapshot<Object?> shop;
  SelectedAService({required this.shop,required this.service});
}
