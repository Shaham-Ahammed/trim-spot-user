import 'package:cloud_firestore/cloud_firestore.dart';

class CollectionReferences {
  CollectionReference<Object?> userCollectionReference() {
    final CollectionReference userCollections =
        FirebaseFirestore.instance.collection('user_information');
    return userCollections;
  }

  CollectionReference shopDetailsReference() {
    return FirebaseFirestore.instance.collection('shop_registration');
  }
}
