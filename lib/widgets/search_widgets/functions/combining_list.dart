import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trim_spot_user_side/data/firebase_collection_references/user_information_reference.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';

Future<List<QueryDocumentSnapshot>> fetchDocumentsBasedOnConditions(String searchWord) async {

  QuerySnapshot shopNameQuery = await CollectionReferences()
     .shopDetailsReference()
     .where(SalonDocumentModel.isApproved, isEqualTo: true)
     .where(SalonDocumentModel.shopName, isGreaterThanOrEqualTo: searchWord)
     .where(SalonDocumentModel.shopName, isLessThan: '$searchWord\uf8ff')
     .get();

  


  QuerySnapshot serviceAvailableQuery = await CollectionReferences()
     .shopDetailsReference()
     .where(SalonDocumentModel.isApproved, isEqualTo: true)
     .where(SalonDocumentModel.servicesList, arrayContains: searchWord.toLowerCase())
     .get();

 

  List<QueryDocumentSnapshot> combinedResults = [];
  combinedResults.addAll(shopNameQuery.docs);
  combinedResults.addAll(serviceAvailableQuery.docs);

  return combinedResults;
}