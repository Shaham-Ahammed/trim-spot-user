part of 'profile_image_bloc.dart';

@immutable
sealed class ProfileImageState {
  final String imagePath;
  final Uint8List? imageInBytes;
 
  const ProfileImageState(
      {required this.imagePath, required this.imageInBytes});
}

final class ProfileImageInitial extends ProfileImageState {
  const ProfileImageInitial(
      {required super.imagePath, required super.imageInBytes});
}
