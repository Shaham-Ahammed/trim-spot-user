class SalonDocumentModel {
  static const String name = "name";
  static const String email = "email";
  static const String phone = "phone";
  static const String shopName = "shopName";
  static const String locationLatLng = "locationLatLng";
  static const String locationName = "locationName";
  static const String licenseImage = "licenseImage";
  static const String profileImage = "profileImage";
  static const String shopImage = "shopImage";
  static const String services = "services";
  static const String parsedOpeningTime = "parsedOpeningTime";
  static const String occasionalClosures = "occasionalClosures";
  static const String parsedClosingTime = "parsedClosingTime";
  static const String holidays = "holidays";
  static const String password = "password";
  static const String isApproved = "isApproved";
  static const String isRejected = "isRejected";
  static const String reviewsAndRatings = "reviewsAndRatings";
  static const String serviceHaircut = "haircut";
  static const String serviceFacial = "facial";
  static const String serviceShave = "shave";
  static const String serviceBeardTrim = "beard trim";
  static const String serviceMassage = "massage";
  static const String serviceStraighten = "straighten";
  static const String serviceTime = "time";
  static const String serviceRate = "rate";
}

class UserDocumentModel {
  static const String imagePath = "imagePath";
  static const String username = "username";
  static const String email = "email";
  static const String phone = "phone";
  static const String password = "password";
}

class ReviewDocumentModel {
  static const String imagePath = 'imagePath';
  static const String userNmae = "userName";
  static const String ratings = "ratings";
  static const String review = "review";
}

class BookingsDocumentModel {
  static const String time = "time";
  static const String name = "name";
  static const String services = "services";
  static const String totalAmount = "totalAmount";
}
