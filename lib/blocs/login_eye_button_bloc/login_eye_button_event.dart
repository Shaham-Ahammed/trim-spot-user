part of 'login_eye_button_bloc.dart';

@immutable
sealed class LoginEyeButtonEvent {}

final class EyeButtonPressed extends LoginEyeButtonEvent{}