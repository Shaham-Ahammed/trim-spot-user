import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_image_bloc/profile_image_bloc.dart';
import 'package:trim_spot_user_side/data/firebase_collection_references/profile_image_reference.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AddImageToFirebaseStorage{

 Future<String> addProfileImageToFirebaseStorage(context)async{
   final metadata = firebase_storage.SettableMetadata(contentType: 'image/jpeg');
       try {
      final profileImageReference =
       userStorageReference(context);
      await profileImageReference.putData(
          BlocProvider.of<ProfileImageBloc>(context).state.imageInBytes!, metadata);
      return profileImageReference.getDownloadURL();
    } catch (e) {
      return "something went wrong while adding profile Image $e";
    }
  }
}