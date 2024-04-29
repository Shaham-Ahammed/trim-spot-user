// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trim_spot_user_side/data/firebase_auth_implementation/firebase_auth_services.dart';

part 'google_sign_in_event.dart';
part 'google_sign_in_state.dart';

class GoogleSignInBloc extends Bloc<GoogleSignInEvent, GoogleSignInState> {
  GoogleSignInBloc() : super(GoogleSignInInitial()) {
    on<GoogleSigninButtonPressed>(_googleSigninButtonPressed);
  }
  _googleSigninButtonPressed(
      GoogleSigninButtonPressed event, Emitter<GoogleSignInState> emit) async {
    emit(ProcessingLogin());

    try {
      await FirebaseAuthService().googleSigninAuthentication();
      emit(GoogleSigninSuccess());
    } catch (e) {
      emit(FailedGoogleSignIn());
      print("error occured while google signin $e");
    }
  }
}
