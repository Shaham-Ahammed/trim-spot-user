import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';

class ReviewsAndRatingsModel {
  final String imagepath;
  final String name;
  final String rating;
  final String review;
  final String currentTime;
  final String serviceDoneOn;
  final String timeSlotWasOn;
  final Timestamp timestamp;

  ReviewsAndRatingsModel(
      {required this.imagepath,
      required this.name,
      required this.timestamp,
      required this.rating,
      required this.currentTime,
      required this.review,
      required this.serviceDoneOn,
      required this.timeSlotWasOn});

  Map<String, dynamic> toMap() {
    return {
      ReviewDocumentModel.timeStamp :timestamp,
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
