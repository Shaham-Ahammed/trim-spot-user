import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/service_booking_blocs/service_selected_bloc/service_selected_bloc.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';

String totalTimeRequired(BuildContext context) {
  final Map<String, Map<String, String>> services =
      BlocProvider.of<ServiceSelectedBloc>(context,listen: false).state.serviceMap;
  int time = 0;
  services.forEach((key, value) {
    if (value.containsKey(SalonDocumentModel.serviceTime)) {
      int timeForAService = int.parse(value[SalonDocumentModel.serviceTime]!);
      time += timeForAService;
    }
  });

  return time.toString();
}

String totalAmountOfServices(BuildContext context) {
  final Map<String, Map<String, String>> services =
      BlocProvider.of<ServiceSelectedBloc>(context,listen: false).state.serviceMap;
  int amount = 0;
  services.forEach((key, value) {
    if (value.containsKey(SalonDocumentModel.serviceRate)) {
      int rateOfOneService = int.parse(value[SalonDocumentModel.serviceRate]!);
      amount += rateOfOneService;
    }
  });

  return amount.toString();
}