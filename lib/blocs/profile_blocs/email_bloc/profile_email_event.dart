part of 'profile_email_bloc.dart';

@immutable
sealed class ProfileEmailEvent {}

final class EmailEditButtonPressed extends ProfileEmailEvent {
 final bool editPressed;

  EmailEditButtonPressed({required this.editPressed});

 
}