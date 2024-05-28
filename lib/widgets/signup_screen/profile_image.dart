
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_image_bloc/profile_image_bloc.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileImageBloc, ProfileImageState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<ProfileImageBloc>().add(SelectedProfile());
          },
          child: CircleAvatar(
              radius: mediaqueryHeight(0.1, context),
              backgroundImage: state.imageInBytes!=null
                  ? MemoryImage(state.imageInBytes!) as ImageProvider
                  : const AssetImage("assets/images/profile upload.png")),
        );
      },
    );
  }
}
