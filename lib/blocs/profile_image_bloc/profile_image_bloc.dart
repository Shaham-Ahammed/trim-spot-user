import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
part 'profile_image_event.dart';
part 'profile_image_state.dart';

class ProfileImageBloc extends Bloc<ProfileImageEvent, ProfileImageState> {
  
  ProfileImageBloc()
      : super(const ProfileImageInitial(imagePath: '', imageInBytes: null)) {
    on<SelectedProfile>(_selectedProfile);
  }
  _selectedProfile(
      SelectedProfile event, Emitter<ProfileImageState> emit) async {
    String? imagePath;
    Uint8List? selectedImageInBytes;
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath = image.name;
      selectedImageInBytes = await image.readAsBytes();

      emit(ProfileImageInitial(
          imagePath: imagePath, imageInBytes: selectedImageInBytes));
    }
  }
}
