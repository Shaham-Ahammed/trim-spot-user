part of 'profile_email_bloc.dart';

@immutable
sealed class ProfileEmailState {
    final String email;
  final bool editPressed;

  const ProfileEmailState({required this.email, required this.editPressed});
}

final class ProfileEmailInitial extends ProfileEmailState {
  const ProfileEmailInitial({required super.email, required super.editPressed});
}
