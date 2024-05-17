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
  static const String servicesList = "servicesList";
}

class UserDocumentModel {
  static const String imagePath = "imagePath";
  static const String username = "username";
  static const String email = "email";
  static const String phone = "phone";
  static const String password = "password";
  static const String bookmarkedShops = "bookmarkedShops";
}

class ReviewDocumentModel {
  static const String imagePath = 'imagePath';
  static const String userNmae = "userName";
  static const String ratings = "ratings";
  static const String review = "review";
  static const String timeStamp = "timeStamp";
  static const String ratingTime = "ratingTime";
  static const String serviceDoneOn = "serviceDoneOn";
  static const String timeSlotWasOn = "timeSlot";
}

class BookingsShopSideDocumentModel {
  static const String userDocId = "userId";
  static const String time = "time";
  static const String name = "name";
  static const String services = "services";
  static const String totalAmount = "totalAmount";
  static const String timeStamp = "timeStamp";
}

class BookingHisotryUserDocumentModel {
  static const String shopId = "shopId";
  static const String currentStatus = "currentStatus";
  static const String date = "date";
  static const String service = "service";
  static const String shopLocation = "shopLocation";
  static const String shopName = "shopName";
  static const String timeStamp = "timeStamp";
  static const String time = "time";
  static const String currentStatusPending = "PENDING";
  static const String currentStatusCompleted = "COMPLETED";
  static const String currentStatusCancelled = "CANCELLED";
  static const String totalAmount = "amount";
}

class WalletUserDocumentModel {
  static const String shopName = "shopName";
  static const String amount = "amount";
  static const String transferDate = "transferDate";
  static const String action = "action";
  static const String credit = 'credit';
  static const String booking = "BOOKING";
  static const String refund = "REFUND";
  static const String timeStamp = "timeStamp";
}
