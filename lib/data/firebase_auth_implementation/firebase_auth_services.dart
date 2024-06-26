// ignore_for_file: avoid_print,, deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trim_spot_user_side/data/data_provider/user_registration.dart';
import 'package:trim_spot_user_side/utils/forgot_password/controller.dart';
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

  Future<String> sendPasswordResetLink() async {
    try {
      final list = await _auth
          .fetchSignInMethodsForEmail(forgotPasswordEmailController.text);
      print(list);
      if (list.isEmpty) {
        return "notRegistered";
      } else {
        try {
          await _auth.sendPasswordResetEmail(
              email: forgotPasswordEmailController.text);
          return "success";
        } catch (e) {
          return "failure";
        }
      }
    } on FirebaseAuthException catch (_) {
      return "somethingwentwrong";
    }
  }

  Future<bool> googleSigninAuthentication() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      await firebaseAuth.signInWithCredential(credential);
      await AddUserDetailsToFirebase()
          .addDataAfterCheckingWhileGoogleSignin(googleSignInAccount);
      return true;
    } else {
      return false;
    }
  }
}
