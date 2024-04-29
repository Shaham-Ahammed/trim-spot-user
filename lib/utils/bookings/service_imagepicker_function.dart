
String serviceImagePicker(String service) {
  switch (service) {
    case "Massage":
      return "assets/images/s4.jpg";
    case "Facial":
      return "assets/images/s5.jpg";
    case "Beard Trim":
      return "assets/images/s2.jpg";
    case "Straighten":
      return "assets/images/s3.jpg";
    case "Shave":
      return "assets/images/s6.jpg";
    default: //haircut
      return "assets/images/s1.jpg";
  }
}
