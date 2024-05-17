// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/name_bloc/profile_name_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/phone_bloc/profile_phone_bloc.dart';
import 'package:trim_spot_user_side/data/data_provider/updating_profile.dart';
import 'package:trim_spot_user_side/data/repository/user_data_document.dart';
import 'package:trim_spot_user_side/data/firebase_collection_references/user_information_reference.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/utils/profile_screen/controllers.dart';
import 'package:trim_spot_user_side/utils/profile_screen/formkey.dart';

part 'profile_save_button_event.dart';
part 'profile_save_button_state.dart';

class ProfileSaveButtonBloc
    extends Bloc<ProfileSaveButtonEvent, ProfileSaveButtonState> {
  ProfileSaveButtonBloc() : super(ProfileSaveButtonInitial()) {
    on<ProfileSaveButtonPressed>(_profileSaveButtonPressed);
  }
  _profileSaveButtonPressed(ProfileSaveButtonPressed event,
      Emitter<ProfileSaveButtonState> emit) async {
    if (profileFormKey.currentState!.validate()) {
      emit(ProfileUpdating());
      final collection = CollectionReferences().userCollectionReference();
      final data = await UserDataDocumentFromFirebase().userDocument();
      try {
      await  ProfileUpdation().changingProfileImage(event.context, collection, data);
      } catch (e) {
         Navigator.pop(event.context);
      }

      if (BlocProvider.of<ProfileNameBloc>(event.context, listen: false)
              .state
              .editPressed ==
          true) {
        collection.doc(data.id).update(
            {UserDocumentModel.username: profileNameController.text.trim()});
      }
      if (BlocProvider.of<ProfilePhoneBloc>(event.context, listen: false)
              .state
              .editPressed ==
          true) {
        collection.doc(data.id).update(
            {UserDocumentModel.phone: profilePhoneController.text.trim()});
      }

      Navigator.pop(event.context);
      emit(ProfileUpdationFinished());
    } else {
      return;
    }
  }
}
