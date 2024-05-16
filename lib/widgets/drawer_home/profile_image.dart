import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/bottom_nav_bloc/bottom_navigation_bloc.dart';
import 'package:trim_spot_user_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class ProfileImageDisplay extends StatelessWidget {
  const ProfileImageDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: mediaqueryHeight(0.05, context),
      backgroundImage: context
              .watch<UserDetailsBloc>()
              .state
              .profileImage
              .isEmpty
          ? const AssetImage("assets/images/profile upload.png")
          : NetworkImage(context.watch<UserDetailsBloc>().state.profileImage)
              as ImageProvider,
    );
  }
}

class ProfileImageEditButton extends StatelessWidget {
  const ProfileImageEditButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        right: 0,
        child: Material(
          borderRadius: BorderRadius.circular(90),
          color: cyanColor,
          child: InkWell(
            onTap: () {
               Navigator.pop(context);
          context
              .read<BottomNavigationBloc>()
              .add(BottomNavBarPressed(currentPage: 3));
            },
            borderRadius: BorderRadius.circular(90),
            child: Container(
              padding: EdgeInsets.all(mediaqueryHeight(0.007, context)),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.edit,
                size: mediaqueryHeight(0.02, context),
              ),
            ),
          ),
        ));
  }
}
