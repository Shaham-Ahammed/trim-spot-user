// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, unrelated_type_equality_checks, use_build_context_synchronously, avoid_print, no_leading_underscores_for_local_identifiers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_image_bloc/profile_image_bloc.dart';
import 'package:trim_spot_user_side/data/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:trim_spot_user_side/data/repository/user_registration.dart';
import 'package:trim_spot_user_side/screens/bottom_navigation.dart';
import 'package:trim_spot_user_side/utils/page%20transitions/no_transition_page_route.dart';
import 'package:trim_spot_user_side/utils/register_page/controllers.dart';
import 'package:trim_spot_user_side/utils/register_page/formkey.dart';
import 'package:trim_spot_user_side/utils/register_page/valuenotifier.dart';
part 'form_validation_event.dart';
part 'form_validation_state.dart';

class FormValidationBloc
    extends Bloc<FormValidationEvent, FormValidationState> {
  FormValidationBloc() : super(FormValidationInitial()) {
    on<SubmitButtonPressed>(_submitButtonPressed);
    on<AuthenticateUserDetails>(_authenticateUserDetails);
    on<ResendEmailButtonPressed>(_resendEmailButtonPressed);
    on<VerifyEmailPressed>(_verifyEmailPressed);
  }
  _submitButtonPressed(
    SubmitButtonPressed event,
    Emitter<FormValidationState> emit,
  ) async {
    pressedSubmitButton.value = true;
    pressedSubmitButton.notifyListeners();
    if (registerFormKey.currentState!.validate() &&
        BlocProvider.of<ProfileImageBloc>(event.context, listen: false)
                .state
                .imageInBytes !=
            null) {
      final connectivity = await Connectivity().checkConnectivity();
      if (connectivity.contains(ConnectivityResult.none)) {
        emit(NetworkError());
        return;
      }
      emit(LoadingState());

      final collection =
          await FirebaseFirestore.instance.collection("user_information").get();

      final List<String> usernames = [];
      usernames.clear();
      for (var doc in collection.docs) {
        usernames.add(doc.data()['username'] as String);
      }

      if (usernames.contains(registerUsernameController.text.trim())) {
        emit(UserNameExists());
        return;
      }

      add(AuthenticateUserDetails(event.context));
    } else {
      return;
    }
  }

  _resendEmailButtonPressed(
      ResendEmailButtonPressed event, Emitter<FormValidationState> emit) {
    try {
      FirebaseAuth _authentication = FirebaseAuth.instance;
      _authentication.currentUser!.sendEmailVerification();
    } catch (e) {
      emit(RegisrationFailure(
        "some thing went wrong",
      ));
    }
  }

  _verifyEmailPressed(
      VerifyEmailPressed event, Emitter<FormValidationState> emit) async {
    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity.contains(ConnectivityResult.none)) {
      emit(NetworkError());
      return;
    }
    emit(LoadingStateOtpScreen());
    try {
      FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user!.emailVerified) {
        Navigator.pop(event.context);
        Navigator.of(event.context).push(
            NoTransitionPageRoute(child: const BottomNavigationBarScreen()));
        emit(NavigateToHomePage());
        print("success");
      } else {
        emit(RegisrationFailure("email not verified"));
      }
    } catch (e) {
      emit(RegisrationFailure("please try again"));
    }
  }

  _authenticateUserDetails(
      AuthenticateUserDetails event, Emitter<FormValidationState> emit) async {
    try {
      FirebaseAuthService _auth = FirebaseAuthService();
      User? user = await _auth.signUpWithEmailAndPassword();
      if (user != null) {
        await AddUserDetailsToFirebase().addDataToFirebase(event.context);
        FirebaseAuth _authentication = FirebaseAuth.instance;
        _authentication.currentUser!.sendEmailVerification();
        emit(NavigateToEmailVerficationPage());
      } else {
        emit(RegisrationFailure(
          "email already registered",
        ));
      }
    } catch (e) {
      emit(RegisrationFailure(
        "something went wrong",
      ));
    }
  }
}
