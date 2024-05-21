import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trim_spot_user_side/blocs/location_permission_bloc/location_permission_bloc.dart';
import 'package:trim_spot_user_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/home/scaffold_key.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class AppBarElements extends StatelessWidget {
  const AppBarElements({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ProfileImageHomeScreen(),
        SizedBox(
          width: mediaqueryWidth(0.05, context),
        ),
        const NameAndLocation(),
        const Spacer(),
        const MenuIcon()
      ],
    );
  }
}

class MenuIcon extends StatelessWidget {
  const MenuIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        homeScaffoldKey.currentState?.openDrawer();
      },
      child: Transform.scale(
          scale: 1.34, child: SvgPicture.asset("assets/icons/menu_icon.svg")),
    );
  }
}

class NameAndLocation extends StatelessWidget {
  const NameAndLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: mediaqueryWidth(0.55, context),

          child:   myFont(context.watch<UserDetailsBloc>().state.userName,
          overflow: TextOverflow.ellipsis,
            fontFamily: balooChettan,
            fontSize: mediaqueryHeight(0.023, context),
            fontWeight: FontWeight.normal,
            fontColor: whiteColor),

        ),
      
        Row(
          children: [
            Icon(
              color: greyColor,
              Icons.location_on_outlined,
              size: mediaqueryHeight(
                0.02,
                context,
              ),
            ),
            BlocBuilder<LocationPermissionBloc, LocationPermissionState>(
              builder: (context, state) {
                if (state is FetchingUserLocation) {
                  return Shimmer.fromColors(
                      direction: ShimmerDirection.ltr,
                      baseColor: greyColor,
                      highlightColor: whiteColor,
                      child: const Text("......"));
                }
                return Text(
                  context.watch<LocationPermissionBloc>().state.currentLocation,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      overflow: null,
                      fontFamily: balooChettan,
                      fontSize: mediaqueryHeight(0.018, context),
                      fontWeight: FontWeight.normal,
                      color: whiteColor),
                );
              },
            ),
          ],
        )
      ],
    );
  }
}

class ProfileImageHomeScreen extends StatelessWidget {
  const ProfileImageHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailsBloc, UserDetailsState>(
      builder: (context, state) {
        return CircleAvatar(
          radius: mediaqueryWidth(0.07, context),
          backgroundImage: state.profileImage.isEmpty
              ? const AssetImage("assets/images/profile upload.png")
              : NetworkImage(state.profileImage) as ImageProvider,
        );
      },
    );
  }
}
