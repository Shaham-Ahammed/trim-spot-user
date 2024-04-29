part of 'location_permission_bloc.dart';

@immutable
sealed class LocationPermissionState {
  final String currentLocation;
 final Position? currentPosition;
  const LocationPermissionState({required this.currentLocation,required this.currentPosition});
}

final class LocationPermissionInitial extends LocationPermissionState {
  const LocationPermissionInitial({required super.currentLocation, required super.currentPosition});
  
}

final class LocationServiceNotEnabled extends LocationPermissionState {
  const LocationServiceNotEnabled({required super.currentLocation, required super.currentPosition});
 
}
