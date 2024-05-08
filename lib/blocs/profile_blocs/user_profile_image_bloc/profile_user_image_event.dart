part of 'profile_user_image_bloc.dart';

@immutable
sealed class ProfileUserImageEvent {}

final class ProfilImageEditPressed extends ProfileUserImageEvent {}

final class FetchUserProfileImage extends ProfileUserImageEvent{}