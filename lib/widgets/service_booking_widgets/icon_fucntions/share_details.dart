import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:share_plus/share_plus.dart';

shareDetails(final QueryDocumentSnapshot<Object?> shop) async {
  GeoPoint location = shop[SalonDocumentModel.locationLatLng];
  final latitude = location.latitude;
  final longitude = location.longitude;
  final rawDataServices =
      shop[SalonDocumentModel.services] as Map<String, dynamic>;
  List<String> servicesAvailable = [];
  rawDataServices.forEach((key, value) {
    servicesAvailable.add(key);
  });
  final String locationUrl =
      'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
  String message = 'Shop Name : ${shop[SalonDocumentModel.shopName]}\n'
      'shop Location : ${shop[SalonDocumentModel.locationName]}\n'
      'services :${servicesAvailable.join(", ")}\n'
      'location : $locationUrl';

  await Share.share(message);
}
