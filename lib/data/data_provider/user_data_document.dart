import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trim_spot_user_side/data/firebase_collection_references/user_information_reference.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/data/shared_preference/functions.dart';

class UserDataDocumentFromFirebase {
  Future<QueryDocumentSnapshot<Object?>> userDocument() async {
    final email = await SharedPreferenceOperation().getGamil();
    final collectionReference = await CollectionReferences()
        .userCollectionReference()
        .where(UserDocumentModel.email, isEqualTo: email)
        .get();
    final data = collectionReference.docs.first;
    return data;
  }

  static late String userId;
  getUserId() async {
    final userDoc = await userDocument();
    userId = userDoc.id;
  }
}
