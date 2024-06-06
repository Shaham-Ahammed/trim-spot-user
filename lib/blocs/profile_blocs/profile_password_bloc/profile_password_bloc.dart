// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/utils/profile_screen/controllers.dart';

part 'profile_password_event.dart';
part 'profile_password_state.dart';

class ProfilePasswordBloc
    extends Bloc<ProfilePasswordEvent, ProfilePasswordState> {
  ProfilePasswordBloc()
      : super(const ProfilePasswordInitial(obscureText: true)) {
    on<SubmitButtonPressed>(_pressedSubmitButtonPressed);
    on<PressedEyeIconOnPassword>(_pressedEyeIconOnPassword);
  }
  _pressedSubmitButtonPressed(
      SubmitButtonPressed event, Emitter<ProfilePasswordState> emit) async {
    if (event.formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      emit(PasswordUpdating(obscureText: state.obscureText));

      final auth = FirebaseAuth.instance;
      final currentUser = auth.currentUser;
      var cred = EmailAuthProvider.credential(
          email: currentUser!.email!,
          password: profileOldPasswordController.text);

      await currentUser.reauthenticateWithCredential(cred).then((value) {
        currentUser.updatePassword(profileNewPasswordController.text);
        emit(PasswordUpdated(obscureText: state.obscureText));
      }).catchError((error) {
        Navigator.pop(event.context);
        emit(IncorrectPassword(obscureText: state.obscureText));
     
      });
    } else {
      return;
    }
  }

  _pressedEyeIconOnPassword(
      PressedEyeIconOnPassword event, Emitter<ProfilePasswordState> emit) {
    final bool newObscureText = !state.obscureText;
    emit(ProfilePasswordInitial(obscureText: newObscureText));
  }
}
