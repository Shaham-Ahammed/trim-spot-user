import 'package:cloud_firestore/cloud_firestore.dart';

class SalonSideBookingModel {
  final String name;
  final String services;
  final String time;
  final String totalAmount;
  final Timestamp timestamp;

  SalonSideBookingModel(
      {required this.name,
      required this.timestamp,
      required this.services,
      required this.time,
      required this.totalAmount});

  Map<String, dynamic> toMap() {
    return {
      "timeStamp":timestamp,
      "name": name,
      "services": services,
      "time": time,
      "totalAmount": totalAmount
    };
  }
}
