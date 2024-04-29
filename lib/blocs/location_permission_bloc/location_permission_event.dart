part of 'location_permission_bloc.dart';

@immutable
sealed class LocationPermissionEvent {}

final class GetLocationPermission extends LocationPermissionEvent{}

final class FetchUserLocation extends LocationPermissionEvent{}