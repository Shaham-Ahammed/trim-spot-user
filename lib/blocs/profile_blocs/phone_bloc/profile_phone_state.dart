part of 'profile_phone_bloc.dart';

@immutable
sealed class ProfilePhoneState {
  
  final bool editPressed;

  const ProfilePhoneState({required this.editPressed});
}

final class ProfilePhoneInitial extends ProfilePhoneState {
  const ProfilePhoneInitial({ required super.editPressed});
}
