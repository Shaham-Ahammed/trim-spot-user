import 'package:flutter/material.dart';

class BookingsModel {
  final String serviceImage;
  final String service;
  final String date;
  final String time;
  final String shopName;
  final String shopLocation;
  final String status;
  final Color statusColor;

  BookingsModel(
      {required this.serviceImage,
      required this.service,
      required this.date,
      required this.time,
      required this.shopName,
      
      required this.shopLocation,
      required this.status,required this.statusColor,});
}
