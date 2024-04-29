import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_phone_event.dart';
part 'profile_phone_state.dart';

class ProfilePhoneBloc extends Bloc<ProfilePhoneEvent, ProfilePhoneState> {
  ProfilePhoneBloc()
      : super(const ProfilePhoneInitial(editPressed: false, phone: "9961628874")) {
    on<ProfilPhoneEdit>(_profilePhoneEdit);
  }
  _profilePhoneEdit(ProfilPhoneEdit event, Emitter<ProfilePhoneState> emit) {
    emit(ProfilePhoneInitial(phone: state.phone, editPressed: event.editPressed));
  }
}
