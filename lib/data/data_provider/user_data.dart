import 'package:trim_spot_user_side/models/user_model.dart';
import 'package:trim_spot_user_side/utils/register_page/controllers.dart';

class UserDetailsData {
  Map<String, dynamic> userData(String downloadURL) {
    final data = UserModel(
            imagePath: downloadURL,
            username: registerUsernameController.text.trim(),
            email: registerEmailController.text.trim(),
            phone: registerPhoneController.text.trim(),
            password: registerPasswordController.text.trim())
        .toMap();
    return data;
  }
}
