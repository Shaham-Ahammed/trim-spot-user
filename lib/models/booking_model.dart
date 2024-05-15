class BookingHistoryModel {
  final String currentStatus;
  final String date;
  final String service;
  final String shopLocation;
  final String shopName;
  final String time;
  final String amount;
  final String shopId;
  BookingHistoryModel({
    required this.currentStatus,
    required this.shopId,
    required this.date,
    required this.service,
    required this.amount,
    required this.shopLocation,
    required this.shopName,
    required this.time,
  });
  Map<String, dynamic> toMap() {
    return {
      "amount" : amount,
      "currentStatus": currentStatus,
      "date": date,
      "service": service,
      "shopLocation": shopLocation,
      "shopName": shopName,
      "time": time,
      'shopId': shopId
    };
  }
}

enum BookingStatus { pending, completed, cancelled }
