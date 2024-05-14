import 'package:trim_spot_user_side/data/repository/document_model.dart';

class UserModel {
  final String imagePath;
  final String username;
  final String email;
  final String phone;
  final String password;
  final List<String> bookmarkedShops;

  UserModel(
      {required this.imagePath,
      required this.username,
      required this.email,
      required this.phone,
      required this.bookmarkedShops,
      required this.password});

  Map<String, dynamic> toMap() {
    return {
      UserDocumentModel.imagePath: imagePath,
      UserDocumentModel.username: username,
      UserDocumentModel.email: email,
      UserDocumentModel.phone: phone,
      UserDocumentModel.password: password,
      UserDocumentModel.bookmarkedShops: bookmarkedShops
    };
  }
}
