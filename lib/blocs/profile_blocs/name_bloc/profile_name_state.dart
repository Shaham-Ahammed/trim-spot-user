part of 'profile_name_bloc.dart';

@immutable
sealed class ProfileNameState {

  final bool editPressed;
   
  const ProfileNameState({ required this.editPressed});
  
}

final class ProfileNameInitial extends ProfileNameState {
  const ProfileNameInitial({ required super.editPressed});
}
