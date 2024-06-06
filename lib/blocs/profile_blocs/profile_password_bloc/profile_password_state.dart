part of 'profile_password_bloc.dart';

@immutable
sealed class ProfilePasswordState {
  final bool obscureText;

  const ProfilePasswordState({required this.obscureText});
}

final class ProfilePasswordInitial extends ProfilePasswordState {
  const ProfilePasswordInitial({required super.obscureText});
}

final class PasswordUpdating extends ProfilePasswordState {
  const PasswordUpdating({required super.obscureText});
}

final class PasswordUpdated extends ProfilePasswordState {
  const PasswordUpdated({required super.obscureText});
}

final class IncorrectPassword extends ProfilePasswordState {
  const IncorrectPassword({required super.obscureText});
}