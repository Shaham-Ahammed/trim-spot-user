import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:trim_spot_user_side/blocs/profile_blocs/name_bloc/profile_name_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/phone_bloc/profile_phone_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/user_profile_image_bloc/profile_user_image_bloc.dart';
import 'package:trim_spot_user_side/data/data_provider/user_data_document.dart';
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
      final connectivity = await Connectivity().checkConnectivity();
      if (connectivity.contains(ConnectionState.none)) {
        emit(NetworkErrorWhileUpdatingProfile());
        return;
      }

      emit(ProfileUpdating());
      final collection = await CollectionReferences().userCollectionReference();
      final data = await UserDataDocumentFromFirebase().userDocument();

      if (!BlocProvider.of<ProfileUserImageBloc>(event.context, listen: false)
          .state
          .newImagePath
          .isEmpty) {
        final metadata =
            firebase_storage.SettableMetadata(contentType: 'image/jpeg');
        try {
          final profileImageRef = firebase_storage.FirebaseStorage.instance
              .ref('user_profile_images')
              .child(BlocProvider.of<ProfileUserImageBloc>(event.context,
                      listen: false)
                  .state
                  .newImagePath);
          await profileImageRef.putData(
              BlocProvider.of<ProfileUserImageBloc>(event.context,
                      listen: false)
                  .state
                  .newProfileUnit8list!,
              metadata);
          final url = await profileImageRef.getDownloadURL();
          collection.doc(data.id).update({UserDocumentModel.imagePath: url});
        } catch (e) {
          Navigator.pop(event.context);
          emit(ProfileSaveButtonInitial());
          return "something went wrong while adding shopImage $e";
        }
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
