import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_image_bloc/profile_image_bloc.dart';



firebase_storage.Reference userStorageReference(context) {
  firebase_storage.Reference userStorage = firebase_storage
      .FirebaseStorage.instance
      .ref('user_profile_images')
      .child(BlocProvider.of<ProfileImageBloc>(context).state.imagePath);
  return userStorage;
}
