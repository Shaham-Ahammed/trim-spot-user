part of 'profile_save_button_bloc.dart';

@immutable
final class ProfileSaveButtonEvent {}

final class ProfileSaveButtonPressed extends ProfileSaveButtonEvent {
  final BuildContext context;

  ProfileSaveButtonPressed({required this.context});
  
}

