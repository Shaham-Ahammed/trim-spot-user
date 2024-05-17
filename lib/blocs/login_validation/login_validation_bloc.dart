// ignore_for_file: avoid_print

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/data/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:trim_spot_user_side/data/shared_preference/functions.dart';
import 'package:trim_spot_user_side/utils/login_screen/controllers.dart';
import 'package:trim_spot_user_side/utils/login_screen/formkey.dart';

part 'login_validation_event.dart';
part 'login_validation_state.dart';

class LoginValidationBloc
    extends Bloc<LoginValidationEvent, LoginValidationState> {
  LoginValidationBloc() : super(LoginValidationInitial()) {
    on<LoginButtonPressed>(_loginButtonPressed);
    on<ResendEmailButtonPressedFromLogin>(_resendEmailButtonPressed);
    on<VerifyEmailPressedFromLogin>(_verifyEmailPressed);
  }
  _loginButtonPressed(
      LoginButtonPressed event, Emitter<LoginValidationState> emit) async {
    if (loginFormKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();

      final connection = await Connectivity().checkConnectivity();

      if (connection.contains(ConnectivityResult.none)) {
        emit(NetworkError());
        return;
      }
      emit(AuthenticatingUser());

      final User? currentUser =
          await FirebaseAuthService().signInWithEmailAndPassword();
      if (currentUser != null) {
        if (currentUser.emailVerified) {
          await SharedPreferenceOperation().setGmail(loginEmailController.text);
          emit(LoginSuccess());
        } else {
          emit(EmailNotVerified());
          try {
            currentUser.sendEmailVerification();
          } catch (e) {
            print("error und $e");
            return;
          }
          emit(NavigateToOtPage());
        }

        return;
      } else {
        emit(IncorrectDetails());
      }
    } else {
      return;
    }
  }

  _verifyEmailPressed(VerifyEmailPressedFromLogin event,
      Emitter<LoginValidationState> emit) async {
    FirebaseAuth.instance.currentUser?.reload();
    final user = FirebaseAuth.instance.currentUser;
    if (user!.emailVerified) {
      await SharedPreferenceOperation().setGmail(user.email!);
      print("success");
      emit(LoginSuccess());
    } else {
      emit(EmailVerificationFailedFromLoginOtpPage());
    }
  }

  _resendEmailButtonPressed(ResendEmailButtonPressedFromLogin event,
      Emitter<LoginValidationState> emit) {
    try {
      final user = FirebaseAuth.instance.currentUser;
      user!.sendEmailVerification();
    } catch (e) {
      print(e);
    }
  }
}
