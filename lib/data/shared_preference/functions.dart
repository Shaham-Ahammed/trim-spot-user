import 'package:shared_preferences/shared_preferences.dart';
import 'package:trim_spot_user_side/data/shared_preference/variables.dart';

class SharedPreferenceOperation {
  setGmail(String email) async {
    final SharedPreferences sharedPreference =
        await SharedPreferences.getInstance();
    sharedPreference.setString(loggedInGmail, email);
  }

  Future<String?> getGamil() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getString(loggedInGmail);
  }

  settingNotAFirstTimeUser() async {
    final SharedPreferences sharedpre = await SharedPreferences.getInstance();
    sharedpre.setBool(firstTimeUser, false);
  }
}
