part of 'profile_user_image_bloc.dart';

@immutable
sealed class ProfileUserImageState {
  final String profileImage;
  final String newImagePath;

  const ProfileUserImageState({required this.profileImage, required this.newImagePath});
 
}

final class ProfileImageInitial extends ProfileUserImageState {
  const ProfileImageInitial({required super.profileImage, required super.newImagePath});

}
