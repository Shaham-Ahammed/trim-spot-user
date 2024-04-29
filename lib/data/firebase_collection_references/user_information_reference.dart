import 'package:cloud_firestore/cloud_firestore.dart';

class CollectionReferences {
 CollectionReference<Object?> userCollectionReference() {
    final CollectionReference userCollections =
        FirebaseFirestore.instance.collection('user_information');
    return userCollections;
  }

   CollectionReference<Object?> salonCollectionReference() {
    final CollectionReference salonCollections =
        FirebaseFirestore.instance.collection('shop_registration');
    return salonCollections;
  }
}
