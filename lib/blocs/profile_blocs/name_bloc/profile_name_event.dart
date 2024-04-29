part of 'profile_name_bloc.dart';

@immutable
sealed class ProfileNameEvent {}

final class NameEditButtonPressed extends ProfileNameEvent {
 final bool editPressed;

  NameEditButtonPressed({required this.editPressed});
}
