import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

openMaps(GeoPoint latlng) async {
  
  double latitude = latlng.latitude;
  double longitude = latlng.longitude;
  final Uri uri = Uri(
    scheme: 'https',
    host: 'www.google.com',
    path: '/maps/search/',
    queryParameters: {
      'api': '1',
      'query': '$latitude,$longitude',
    },
  );
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $uri';
  }
}
