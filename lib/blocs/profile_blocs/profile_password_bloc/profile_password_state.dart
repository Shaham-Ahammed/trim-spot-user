part of 'profile_password_bloc.dart';

@immutable
sealed class ProfilePasswordState {}

final class ProfilePasswordInitial extends ProfilePasswordState{}

final class PasswordUpdating extends ProfilePasswordState{}

final class PasswordUpdated extends ProfilePasswordState{}