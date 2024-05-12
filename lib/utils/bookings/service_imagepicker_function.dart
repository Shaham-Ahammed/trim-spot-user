import 'package:trim_spot_user_side/data/repository/document_model.dart';

String serviceImagePicker(String service) {
  List<String> services = service.split(",");
  String firstService = services.first;
  switch (firstService) {
    case SalonDocumentModel.serviceMassage:
      return "assets/images/s4.jpg";
    case SalonDocumentModel.serviceFacial:
      return "assets/images/s5.jpg";
    case SalonDocumentModel.serviceBeardTrim:
      return "assets/images/s2.jpg";
    case SalonDocumentModel.serviceStraighten:
      return "assets/images/s3.jpg";
    case SalonDocumentModel.serviceShave:
      return "assets/images/s6.jpg";
    default: //haircut
      return "assets/images/s1.jpg";
  }
}
