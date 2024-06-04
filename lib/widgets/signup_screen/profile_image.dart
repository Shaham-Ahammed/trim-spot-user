import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_image_bloc/profile_image_bloc.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileImageBloc, ProfileImageState>(
      builder: (context, state) {
        return Stack(children: [
          GestureDetector(
            onTap: () {
              context.read<ProfileImageBloc>().add(SelectedProfile());
            },
            child: CircleAvatar(
                radius: mediaqueryHeight(0.1, context),
                backgroundImage: state.imageInBytes != null
                    ? MemoryImage(state.imageInBytes!) as ImageProvider
                    : const AssetImage("assets/images/profile upload.png")),
          ),
          Positioned(
              right: 0,
              bottom: mediaqueryHeight(0.016, context),
              child: GestureDetector(
                onTap: () {
                  context.read<ProfileImageBloc>().add(SelectedProfile());
                },
                child: Container(
                  padding: EdgeInsets.all(mediaqueryHeight(0.015, context)),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: blackColor),
                  child: Icon(
                    Icons.add_a_photo,
                    color: whiteColor,
                    size: mediaqueryHeight(0.022, context),
                  ),
                ),
              ))
        ]);
      },
    );
  }
}
