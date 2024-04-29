part of 'profile_name_bloc.dart';

@immutable
sealed class ProfileNameState {
  final String name;
  final bool editPressed;
   
  const ProfileNameState({required this.name, required this.editPressed});
  
}

final class ProfileNameInitial extends ProfileNameState {
  const ProfileNameInitial({required super.name, required super.editPressed});
}
