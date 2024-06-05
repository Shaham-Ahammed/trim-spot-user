import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_eye_button_event.dart';
part 'login_eye_button_state.dart';

class LoginEyeButtonBloc
    extends Bloc<LoginEyeButtonEvent, LoginEyeButtonState> {
  LoginEyeButtonBloc() : super(const LoginEyeButtonInitial(visible: false)) {
    on<EyeButtonPressed>(_eyeButtonPressed);
  }
  _eyeButtonPressed(EyeButtonPressed event, Emitter<LoginEyeButtonState> emit) {
    final bool change = !state.visible;
    emit(LoginEyeButtonInitial(visible: change));
  }
}
