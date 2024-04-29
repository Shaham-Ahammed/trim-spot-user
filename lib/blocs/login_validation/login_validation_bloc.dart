// ignore_for_file: avoid_print

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/data/firebase_auth_implementation/firebase_auth_services.dart';
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

      final User? user =
          await FirebaseAuthService().signInWithEmailAndPassword();
      if (user != null) {
        if (user.emailVerified) {
          emit(LoginSuccess());
        } else {
          emit(EmailNotVerified());

          user.sendEmailVerification();
          emit(NavigateToOtPage(user));
        }

        return;
      } else {
        emit(IncorrectDetails());
      }
    } else {
      return;
    }
  }

  _verifyEmailPressed(
      VerifyEmailPressedFromLogin event, Emitter<LoginValidationState> emit) {
    final user = (state as NavigateToOtPage).user;
    emit(LoadingStateLogin());
    if (user.emailVerified) {
      emit(LoginSuccess());
      print("success");
    } else {
      emit(EmailVerificationFailedFromOtpPage());
    }
  }

  _resendEmailButtonPressed(
      ResendEmailButtonPressedFromLogin event, Emitter<LoginValidationState> emit) {
    (state as NavigateToOtPage).user.sendEmailVerification();
  }
}
