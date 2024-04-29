
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/user_profile_image_bloc/profile_user_image_bloc.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class ProfilePictureEditButton extends StatelessWidget {
  const ProfilePictureEditButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: mediaqueryWidth(0.285, context),
      top: mediaqueryHeight(0.111, context),
      child: Material(
        color: greyColor3,
        borderRadius: BorderRadius.circular(90),
        child: InkWell(
          borderRadius: BorderRadius.circular(90),
          onTap: () {
            context.read<ProfileUserImageBloc>().add(ProfilImageEditPressed());
          },
          child: Container(
            padding: EdgeInsets.all(mediaqueryHeight(0.008, context)),
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: transparentColor),
            child: Icon(
              Icons.edit,
              color: blackColor,
              size: mediaqueryHeight(0.023, context),
            ),
          ),
        ),
      ),
    );
  }
}
