part of 'user_details_bloc.dart';

@immutable
sealed class UserDetailsState {
  final String profileImage;
  final String userName;
  final String phone;
  final String password;
  final String email;

  const UserDetailsState(
      {required this.profileImage,
      required this.userName,
      required this.phone,
      required this.password,
      required this.email});
}

final class UserDetailsInitial extends UserDetailsState {
  const UserDetailsInitial(
      {required super.profileImage,
      required super.userName,
      required super.phone,
      required super.password,
      required super.email});
}
