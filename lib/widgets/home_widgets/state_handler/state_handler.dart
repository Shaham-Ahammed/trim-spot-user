import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/blocs/location_permission_bloc/location_permission_bloc.dart';
import 'package:trim_spot_user_side/utils/snack_bars.dart';

class HomeStateHandler {
  static void handleState(BuildContext context, LocationPermissionState state) {
    if (state is LocationServiceNotEnabled) {
      ScaffoldMessenger.of(context)
          .showSnackBar(errorSnackBar("Please enable location permission"));
    }
  }
}
