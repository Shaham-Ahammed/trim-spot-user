part of 'login_eye_button_bloc.dart';

@immutable
sealed class LoginEyeButtonState {
  final bool visible;

 const LoginEyeButtonState({required this.visible});
}

final class LoginEyeButtonInitial extends LoginEyeButtonState {
 const LoginEyeButtonInitial({required super.visible});
}
