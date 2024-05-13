import 'package:trim_spot_user_side/data/repository/document_model.dart';

class ReviewsAndRatingsModel {
  final String imagepath;
  final String name;
  final String rating;
  final String review;
  final String currentTime;
  final String serviceDoneOn;
  final String timeSlotWasOn;

  ReviewsAndRatingsModel(
      {required this.imagepath,
      required this.name,
      required this.rating,
      required this.currentTime,
      required this.review,
      required this.serviceDoneOn,
      required this.timeSlotWasOn});

  Map<String, dynamic> toMap() {
    return {
      ReviewDocumentModel.imagePath: imagepath,
      ReviewDocumentModel.ratings: rating,
      ReviewDocumentModel.review: review,
      ReviewDocumentModel.userNmae: name,
      ReviewDocumentModel.ratingTime: currentTime,
      ReviewDocumentModel.timeSlotWasOn: timeSlotWasOn,
      ReviewDocumentModel.serviceDoneOn: serviceDoneOn
    };
  }
}
