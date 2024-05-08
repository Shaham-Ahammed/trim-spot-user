part of 'profile_save_button_bloc.dart';

@immutable
sealed class ProfileSaveButtonState {}

final class ProfileSaveButtonInitial extends ProfileSaveButtonState{}

final class ProfileUpdating extends ProfileSaveButtonState{}

final class ProfileUpdationFinished extends ProfileSaveButtonState{}

final class NetworkErrorWhileUpdatingProfile extends ProfileSaveButtonState{}