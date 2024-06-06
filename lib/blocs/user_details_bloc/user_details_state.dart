part of 'user_details_bloc.dart';

@immutable
sealed class UserDetailsState {
  final String profileImage;
  final String userName;
  final String phone;

  final String email;
  final String id;
  final User? user;
  final bool emailRegistered;

  const UserDetailsState(
      {required this.profileImage,
      required this.userName,
      required this.phone,
      required this.id,
      required this.user,
      required this.email,
      required this.emailRegistered
      });
}

final class UserDetailsInitial extends UserDetailsState {
  const UserDetailsInitial(
      {required super.profileImage,
      required super.id,
      required super.emailRegistered,
      required super.user,
      required super.userName,
      required super.phone,
      required super.email});
}
