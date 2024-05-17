import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:trim_spot_user_side/blocs/profile_blocs/user_profile_image_bloc/profile_user_image_bloc.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';

class ProfileUpdation {
  changingProfileImage(context, CollectionReference<Object?> collection,
      QueryDocumentSnapshot<Object?> data) async {
    if (BlocProvider.of<ProfileUserImageBloc>(context, listen: false)
        .state
        .newImagePath
        .isNotEmpty) {
      final metadata =
          firebase_storage.SettableMetadata(contentType: 'image/jpeg');
      try {
        final profileImageRef = firebase_storage.FirebaseStorage.instance
            .ref('user_profile_images')
            .child(BlocProvider.of<ProfileUserImageBloc>(context, listen: false)
                .state
                .newImagePath);
        await profileImageRef.putData(
            BlocProvider.of<ProfileUserImageBloc>(context, listen: false)
                .state
                .newProfileUnit8list!,
            metadata);
        final url = await profileImageRef.getDownloadURL();
        collection.doc(data.id).update({UserDocumentModel.imagePath: url});
      } catch (e) {
       

        return "something went wrong while adding shopImage $e";
      }
    }
  }
}
