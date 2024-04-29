import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

part 'location_permission_event.dart';
part 'location_permission_state.dart';

class LocationPermissionBloc
    extends Bloc<LocationPermissionEvent, LocationPermissionState> {
  LocationPermissionBloc()
      : super(const LocationPermissionInitial(
            currentLocation: '', currentPosition: null)) {
    on<GetLocationPermission>(_getLocationPermission);
    on<FetchUserLocation>(_fetchUserLocation);
  }
  _getLocationPermission(GetLocationPermission event,
      Emitter<LocationPermissionState> emit) async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      emit(const LocationServiceNotEnabled(
          currentLocation: '', currentPosition: null));
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(const LocationServiceNotEnabled(
            currentLocation: '', currentPosition: null));
        return;
      }
      if (permission == LocationPermission.deniedForever) {
        emit(const LocationServiceNotEnabled(
            currentLocation: '', currentPosition: null));
        return;
      }
    }
    add(FetchUserLocation());
  }

  _fetchUserLocation(
      FetchUserLocation event, Emitter<LocationPermissionState> emit) async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      await placemarkFromCoordinates(position.latitude, position.longitude)
          .then((List<Placemark> placemarks) {
        Placemark place = placemarks[0];
        final locality = place.locality;

        emit(LocationPermissionInitial(
            currentLocation: locality!, currentPosition: position));
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }
}
