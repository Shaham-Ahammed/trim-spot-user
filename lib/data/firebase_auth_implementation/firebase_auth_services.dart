// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:trim_spot_user_side/utils/login_screen/controllers.dart';
import 'package:trim_spot_user_side/utils/register_page/controllers.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword() async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: registerEmailController.text.trim(),
          password: registerPasswordController.text.trim());

      return credential.user;
    } catch (e) {
      print("some error occured $e");
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword() async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: loginEmailController.text.trim(),
          password: loginPasswordController.text.trim());

      return credential.user;
    } catch (e) {
      print("some error occured $e");
    }
    return null;
  }
}
