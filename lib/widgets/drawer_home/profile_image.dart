import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/screens/profile.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/page%20transitions/fade_transition.dart';

class ProfileImageDisplay extends StatelessWidget {
  const ProfileImageDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: mediaqueryHeight(0.05, context),
      backgroundImage: const AssetImage("assets/images/s2.jpg"),
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
              Navigator.of(context).push(
                  FadeTransitionPageRoute(
                      child: const ProfileScreen()));
            },
            borderRadius: BorderRadius.circular(90),
            child: Container(
              padding: EdgeInsets.all(
                  mediaqueryHeight(0.007, context)),
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

