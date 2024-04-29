import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/service_booking_blocs/service_selected_bloc/service_selected_bloc.dart';
import 'package:trim_spot_user_side/models/services_available.dart';

String totalTimeRequired(context) {
  final List<ServicesAvailableModel> list =
      BlocProvider.of<ServiceSelectedBloc>(context).state.servicesSelected;
  int time = 0;
  for (var element in list) {
    time += element.time;
  }

  return time.toString();
}
