// ignore_for_file: avoid_print

import 'package:trim_spot_user_side/data/data_provider/add_image_to_firebase.dart';
import 'package:trim_spot_user_side/data/data_provider/user_data.dart';
import 'package:trim_spot_user_side/data/firebase_collection_references/user_information_reference.dart';

class AddUserDetailsToFirebase {
  addDataToFirebase(context) async {
    try {
      final profileImageUrl = await AddImageToFirebaseStorage()
          .addProfileImageToFirebaseStorage(context);
      final data = UserDetailsData().userData(profileImageUrl);

     CollectionReferences().userCollectionReference().add(data);
    } catch (e) {
      print("error");
    }
  }
}
