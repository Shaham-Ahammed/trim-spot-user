import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_user_image_event.dart';
part 'profile_user_image_state.dart';

class ProfileUserImageBloc
    extends Bloc<ProfileUserImageEvent, ProfileUserImageState> {
  ProfileUserImageBloc()
      : super(const ProfileImageInitial(
            profileImage: "assets/images/s2.jpg", newImagePath: '')) {
    on<ProfilImageEditPressed>(_profileImageEditPressed);
  }
  _profileImageEditPressed(
      ProfilImageEditPressed event, Emitter<ProfileUserImageState> emit) async {
    final ImagePicker imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(ProfileImageInitial(
          profileImage: state.profileImage, newImagePath: image.path));
    }
  }
}
