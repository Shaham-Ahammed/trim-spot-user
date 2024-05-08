import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_phone_event.dart';
part 'profile_phone_state.dart';

class ProfilePhoneBloc extends Bloc<ProfilePhoneEvent, ProfilePhoneState> {
  ProfilePhoneBloc() : super(const ProfilePhoneInitial(editPressed: false)) {
    on<ProfilPhoneEditButtonPressed>(_profilePhoneEdit);
  }
  _profilePhoneEdit(ProfilPhoneEditButtonPressed event, Emitter<ProfilePhoneState> emit) {
    emit(ProfilePhoneInitial(editPressed: event.editPressed));
  }
}
