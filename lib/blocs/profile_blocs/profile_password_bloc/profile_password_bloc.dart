// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/data/repository/user_data_document.dart';
import 'package:trim_spot_user_side/data/firebase_collection_references/user_information_reference.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';


part 'profile_password_event.dart';
part 'profile_password_state.dart';

class ProfilePasswordBloc
    extends Bloc<ProfilePasswordEvent, ProfilePasswordState> {
  ProfilePasswordBloc() : super(ProfilePasswordInitial()) {
    on<SubmitButtonPressed>(_pressedSubmitButtonPressed);
  }
  _pressedSubmitButtonPressed(SubmitButtonPressed event,
      Emitter<ProfilePasswordState> emit) async {
    if (event.formKey.currentState!.validate()) {
      emit(PasswordUpdating());
      final collection = CollectionReferences().userCollectionReference();
      final user = await UserDataDocumentFromFirebase().userDocument();
      final userId = user.id;
      try {
        await collection.doc(userId).update(
            {UserDocumentModel.password : event.newPasswordController.text});
        emit(PasswordUpdated());
        return;
      } catch (e) {
        Navigator.pop(event.context);
        emit(ProfilePasswordInitial());
      }
    } else {
      return;
    }
  }
}
