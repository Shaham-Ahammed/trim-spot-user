class SalonSideBookingModel {
  final String name;
  final String services;
  final String time;
  final String totalAmount;

  SalonSideBookingModel(
      {required this.name,
      required this.services,
      required this.time,
      required this.totalAmount});
      
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "services": services,
      "time": time,
      "totalAmount": totalAmount
    };
  }
}
