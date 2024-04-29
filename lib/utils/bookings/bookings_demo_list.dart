import 'package:trim_spot_user_side/models/bookings_model.dart';
import 'package:trim_spot_user_side/utils/bookings/service_imagepicker_function.dart';
import 'package:trim_spot_user_side/utils/bookings/status_color_fucntion.dart';

List<BookingsModel> bookingsModelList = [
  BookingsModel(
      serviceImage: serviceImagePicker("Massage"),
      service: "Massage",
      date: "Sun, 13 Feb, 2024",
      time: "02:00 PM",
      shopName: "Baroda Salon",
      shopLocation: "Feroke",
      status: "pending",
      statusColor: statusColorSelector("pending")),
  BookingsModel(
      serviceImage: serviceImagePicker("Facial"),
      service: "Facial",
      date: "Sun, 12 Feb, 2024",
      time: "02:00 PM",
      shopName: "Baroda Salon",
      shopLocation: "Feroke",
      status: "cancelled",
      statusColor: statusColorSelector("cancelled")),
  BookingsModel(
      serviceImage: serviceImagePicker("Haircut"),
      service: "Haircut",
      date: "Sun, 11 Feb, 2024",
      time: "02:02 PM",
      shopName: "Baroda Salon",
      shopLocation: "Feroke",
      status: "completed",
      statusColor: statusColorSelector("completed")),

];
