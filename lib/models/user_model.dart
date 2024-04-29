class UserModel {
  final String imagePath;
  final String username;
  final String email;
  final String phone;
  final String password;

  UserModel(
      {required this.imagePath,
      required this.username,
      required this.email,
      required this.phone,
      required this.password});

  Map<String, dynamic> toMap() {
    return {
      "imagePath": imagePath,
      "username": username,
      "email": email,
      "phone": phone,
      "password": password
    };
  }
}
