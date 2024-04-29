import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_name_event.dart';
part 'profile_name_state.dart';

class ProfileNameBloc extends Bloc<ProfileNameEvent, ProfileNameState> {
  ProfileNameBloc()
      : super(const ProfileNameInitial(editPressed: false, name: "jack robert")) {
    on<NameEditButtonPressed>(_nameEditButtonPressed);
  }
  _nameEditButtonPressed(
      NameEditButtonPressed event, Emitter<ProfileNameState> emit) {
    emit(ProfileNameInitial(name: state.name, editPressed: event.editPressed));
  
  }
}
