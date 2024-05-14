// ignore_for_file: avoid_print

import 'package:google_sign_in/google_sign_in.dart';
import 'package:trim_spot_user_side/data/data_provider/add_image_to_firebase.dart';
import 'package:trim_spot_user_side/data/data_provider/register_user_data.dart';
import 'package:trim_spot_user_side/data/firebase_collection_references/user_information_reference.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/data/shared_preference/functions.dart';
import 'package:trim_spot_user_side/models/user_model.dart';

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

  addDataAfterCheckingWhileGoogleSignin(
      GoogleSignInAccount googleSignInAccount) async {
    final collectionReference =
        CollectionReferences().userCollectionReference();
    final doc = await collectionReference
        .where(UserDocumentModel.email, isEqualTo: googleSignInAccount.email)
        .get();
    if (doc.docs.isEmpty) {
      final data = UserModel(
              imagePath: googleSignInAccount.photoUrl ?? "",
              username: googleSignInAccount.displayName ?? "",
              email: googleSignInAccount.email,
              phone: "",
              password: "", bookmarkedShops: [])
          .toMap();
      try {
        await collectionReference.add(data);
      } catch (e) {
        print("something wrong with adding data $e");
        return;
      }
    }
    await SharedPreferenceOperation().setGmail(googleSignInAccount.email);
  }
}
