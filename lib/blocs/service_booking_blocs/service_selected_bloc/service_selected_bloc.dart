// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';

part 'service_selected_event.dart';
part 'service_selected_state.dart';

class ServiceSelectedBloc
    extends Bloc<ServiceSelectedEvent, ServiceSelectedState> {
  ServiceSelectedBloc() : super(const ServiceSelectedInitial(serviceMap: {})) {
    on<SelectedAService>(_selectedAService);
  }
  _selectedAService(
      SelectedAService event, Emitter<ServiceSelectedState> emit) {
    Map<String, Map<String, String>> map =  Map.from(state.serviceMap);
    if (map.containsKey(event.service)) {
      map.remove(event.service);
      emit(ServiceSelectedInitial(serviceMap: map));

      print("removed");
    } else {
      map.addAll({
        event.service: ({
          SalonDocumentModel.serviceTime:
              event.shop[SalonDocumentModel.services][event.service]
                  [SalonDocumentModel.serviceTime],
          SalonDocumentModel.serviceRate:
              event.shop[SalonDocumentModel.services][event.service]
                  [SalonDocumentModel.serviceRate],
        }),
      });

      emit(ServiceSelectedInitial(serviceMap: map));
      print("added");
    }
  }
}
