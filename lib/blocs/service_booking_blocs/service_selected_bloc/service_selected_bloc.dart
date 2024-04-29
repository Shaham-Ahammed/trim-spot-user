// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/models/services_available.dart';

part 'service_selected_event.dart';
part 'service_selected_state.dart';

class ServiceSelectedBloc
    extends Bloc<ServiceSelectedEvent, ServiceSelectedState> {
  ServiceSelectedBloc() : super(const ServiceSelectedInitial(servicesSelected: [])) {
    on<SelectedAService>(_selectedAService);
  }
  _selectedAService(
      SelectedAService event, Emitter<ServiceSelectedState> emit) {
    if (state.servicesSelected.contains(event.service)) {
      final list = [...state.servicesSelected];
      list.remove(event.service);
      emit(ServiceSelectedInitial(servicesSelected: list));

      print("removed");
    } else {
      final list = [...state.servicesSelected];
      list.add(event.service);
      emit(ServiceSelectedInitial(servicesSelected: list));
      print("Added");
    }
  }
}
