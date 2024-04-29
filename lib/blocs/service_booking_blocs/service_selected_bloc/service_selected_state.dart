part of 'service_selected_bloc.dart';

@immutable
sealed class ServiceSelectedState {
  final List<ServicesAvailableModel> servicesSelected;

  const ServiceSelectedState({required this.servicesSelected});
}

final class ServiceSelectedInitial extends ServiceSelectedState {
  const ServiceSelectedInitial({required super.servicesSelected});
}
