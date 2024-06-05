import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'registration_password_eye_event.dart';
part 'registration_password_eye_state.dart';

class RegistrationPasswordEyeBloc
    extends Bloc<RegistrationPasswordEyeEvent, RegistrationPasswordEyeState> {
  RegistrationPasswordEyeBloc()
      : super(const RegistrationPasswordEyeInitial(visible: false)) {
    on<SignUpEyeButtonPressed>(_eyeButtonPressed);
  }
  _eyeButtonPressed(SignUpEyeButtonPressed event,
      Emitter<RegistrationPasswordEyeState> emit) {
    final bool change = !state.visible;
    emit(RegistrationPasswordEyeInitial(visible: change));
  }
}
