// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

import 'package:geolocator/geolocator.dart';
import 'package:trim_spot_user_side/blocs/nearby_salons_bloc/nearby_salons_bloc.dart';
import 'package:trim_spot_user_side/data/firebase_collection_references/user_information_reference.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';

Future<List<QueryDocumentSnapshot<Object?>>> fetchNearbySalons(
    BuildContext context) async {
  Position? userLocation = await fetchingUserLocation();
  print(userLocation);
  if (userLocation != null) {
    final userLatitude = userLocation.latitude;
    final userLongitude = userLocation.longitude;

    final salons = await CollectionReferences().shopDetailsReference().get();

    final List<QueryDocumentSnapshot<Object?>> nearbySalons = [];

    for (var shop in salons.docs) {
      final GeoPoint shopLatAndLang = shop[SalonDocumentModel.locationLatLng];
      final shopLat = shopLatAndLang.latitude;
      final shopLong = shopLatAndLang.longitude;
      final distance =
          calculateDistance(userLatitude, userLongitude, shopLat, shopLong);
      if (distance <= 5) {
        nearbySalons.add(shop);
      }
    }
    context
        .read<NearbySalonsBloc>()
        .add(FetchingTotalLength(totalLength: nearbySalons.length));
    return nearbySalons;
  }
  return [];
}

double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
  const R = 6371; // Radius of the Earth in km
  final dLat = (lat2 - lat1) * pi / 180;
  final dLon = (lon2 - lon1) * pi / 180;
  final a = sin(dLat / 2) * sin(dLat / 2) +
      cos(lat1 * pi / 180) *
          cos(lat2 * pi / 180) *
          sin(dLon / 2) *
          sin(dLon / 2);
  final c = 2 * atan2(sqrt(a), sqrt(1 - a));
  final distance = R * c; // Distance in km
  return distance;
}

Future<Position?> fetchingUserLocation() async {
  try {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  } catch (e) {
    return null;
  }
}
