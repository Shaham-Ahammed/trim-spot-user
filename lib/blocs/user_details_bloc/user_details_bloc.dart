// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/data/firebase_collection_references/user_information_reference.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/data/shared_preference/functions.dart';

part 'user_details_event.dart';
part 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  UserDetailsBloc()
      : super(const UserDetailsInitial(
            profileImage: '',
            user: null,
            userName: '',
            id: "",
            phone: '',
            emailRegistered: false,
            email: '')) {
    on<FetchingUserDetailsFromFirebase>(_fetchingUserDetailsFromFirebase);
  }
  _fetchingUserDetailsFromFirebase(FetchingUserDetailsFromFirebase event,
      Emitter<UserDetailsState> emit) async {
    final email = await SharedPreferenceOperation().getGamil();
    if (email == null || email.isEmpty) {
      return;
    }
    final collection = await CollectionReferences()
        .userCollectionReference()
        .where(UserDocumentModel.email, isEqualTo: email)
        .get();

    final FirebaseAuth auth = FirebaseAuth.instance;

    final userData = collection.docs.first;

    var emailExists = false;
    final List<String> loginMethods = await auth
        .fetchSignInMethodsForEmail(userData[UserDocumentModel.email]);

    if (loginMethods.contains("password")) {
      emailExists = true;
    }

    emit(UserDetailsInitial(
        user: auth.currentUser,
        emailRegistered: emailExists,
        profileImage: userData[UserDocumentModel.imagePath],
        userName: userData[UserDocumentModel.username],
        phone: userData[UserDocumentModel.phone],
        email: userData[UserDocumentModel.email],
        id: userData.id));
  }
}
