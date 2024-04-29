import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_email_event.dart';
part 'profile_email_state.dart';

class ProfileEmailBloc extends Bloc<ProfileEmailEvent, ProfileEmailState> {
  ProfileEmailBloc()
      : super(
            const ProfileEmailInitial(email: 'sha7@gmail.com', editPressed: false)) {
    on<EmailEditButtonPressed>(_emailEditButtonPressed);
  }
  _emailEditButtonPressed(
      EmailEditButtonPressed event, Emitter<ProfileEmailState> emit) {
    emit(ProfileEmailInitial(email: state.email, editPressed: event.editPressed));
  }
}
