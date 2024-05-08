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
            userName: '',
            phone: '',
            password: '',
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

    final userData = collection.docs.first;

    emit(UserDetailsInitial(
        profileImage: userData[UserDocumentModel.imagePath],
        userName: userData[UserDocumentModel.username],
        phone: userData[UserDocumentModel.phone],
        password: userData[UserDocumentModel.password],
        email: userData[UserDocumentModel.email]));
  }
}
