part of 'profile_phone_bloc.dart';

@immutable
sealed class ProfilePhoneEvent {}

final class ProfilPhoneEdit extends ProfilePhoneEvent {
 final bool editPressed;

  ProfilPhoneEdit({required this.editPressed});
}
