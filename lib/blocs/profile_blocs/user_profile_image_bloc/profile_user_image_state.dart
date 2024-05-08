part of 'profile_user_image_bloc.dart';

@immutable
sealed class ProfileUserImageState {
  final Uint8List? newProfileUnit8list;
  final String newImagePath;
  final String originalProfilePic;

  ProfileUserImageState(
      {required this.newProfileUnit8list,
      required this.newImagePath,
      required this.originalProfilePic});
}

final class ProfileImageInitial extends ProfileUserImageState {
  ProfileImageInitial(
      {required super.newProfileUnit8list,
      required super.newImagePath,
      required super.originalProfilePic});
}
