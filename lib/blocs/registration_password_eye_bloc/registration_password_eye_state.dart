part of 'registration_password_eye_bloc.dart';

@immutable
sealed class RegistrationPasswordEyeState {
  final bool visible;

  const RegistrationPasswordEyeState({required this.visible});
}

final class RegistrationPasswordEyeInitial
    extends RegistrationPasswordEyeState {
  const RegistrationPasswordEyeInitial({required super.visible});
}
