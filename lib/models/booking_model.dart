
class BookingHistoryModel {
 final String currentStatus;
 final String date;
 final String service;
 final String shopLocation;
 final String shopName;
 final String time;

  BookingHistoryModel({
    required this.currentStatus,
    required this.date,
    required this.service,
    required this.shopLocation,
    required this.shopName,
    required this.time,
  });
  Map<String, dynamic> toMap() {
    return {
      "currentStatus": currentStatus,
      "date": date,
      "service": service,
      "shopLocation": shopLocation,
      "shopName": shopName,
      "time": time
    };
  }
}

enum BookingStatus { pending, completed, cancelled }
