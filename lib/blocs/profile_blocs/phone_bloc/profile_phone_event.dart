part of 'profile_phone_bloc.dart';

@immutable
sealed class ProfilePhoneEvent {}

final class ProfilPhoneEditButtonPressed extends ProfilePhoneEvent {
 final bool editPressed;

  ProfilPhoneEditButtonPressed({required this.editPressed});
}
