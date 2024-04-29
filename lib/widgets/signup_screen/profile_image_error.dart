
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_image_bloc/profile_image_bloc.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/register_page/valuenotifier.dart';
class ProfileImageError extends StatelessWidget {
  const ProfileImageError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: pressedSubmitButton,
      builder: (context, value, child) {
        return BlocBuilder<ProfileImageBloc, ProfileImageState>(
          builder: (context, state) {
            if (value && state.imagePath.isEmpty) {
              return Column(
                children: [
                  SizedBox(
                    height: mediaqueryHeight(0.01, context),
                  ),
                  Text(
                    "upload profile image",
                    style: TextStyle(
                      color: Colors.red.shade800,
                      fontSize: 13.0,
                    ),
                  ),
                ],
              );
            }
            return Container();
          },
        );
      },
    );
  }
}
