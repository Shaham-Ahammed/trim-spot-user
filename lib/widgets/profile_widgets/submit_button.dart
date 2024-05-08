import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/name_bloc/profile_name_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/phone_bloc/profile_phone_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/profile_save_button_bloc/profile_save_button_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/user_profile_image_bloc/profile_user_image_bloc.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/submit_button.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Material(
      color: boxColor(context),
      borderRadius: BorderRadius.circular(90),
      child: boxColor(context) == cyanColor
          ? InkWell(
              onTap: () async {
                context
                    .read<ProfileSaveButtonBloc>()
                    .add(ProfileSaveButtonPressed(context: context));
              },
              borderRadius: BorderRadius.circular(90),
              child: Container(
                width: mediaqueryWidth(0.35, context),
                height: mediaqueryHeight(0.04, context),
                decoration: BoxDecoration(
                    color: transparentColor,
                    borderRadius: BorderRadius.circular(90)),
                child: Center(
                  child: myFont("Save Changes",
                      fontFamily: balooChettan,
                      fontSize: mediaqueryHeight(0.02, context),
                      fontWeight: FontWeight.w600,
                      fontColor: blackColor),
                ),
              ),
            )
          : Container(
              width: mediaqueryWidth(0.35, context),
              height: mediaqueryHeight(0.04, context),
              decoration: BoxDecoration(
                  color: greyColor3, borderRadius: BorderRadius.circular(90)),
              child: Center(
                child: myFont("Save Changes",
                    fontFamily: balooChettan,
                    fontSize: mediaqueryHeight(0.02, context),
                    fontWeight: FontWeight.w600,
                    fontColor: blackColor),
              ),
            ),
    ));
  }
}

Color boxColor(context) {
  if (BlocProvider.of<ProfileUserImageBloc>(context, listen: true)
          .state
          .newImagePath
          .isEmpty &&
      BlocProvider.of<ProfileNameBloc>(context, listen: true)
              .state
              .editPressed ==
          false &&
      BlocProvider.of<ProfilePhoneBloc>(context, listen: true)
              .state
              .editPressed ==
          false) {
    return greyColor3;
  } else {
    return cyanColor;
  }
}
