
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/name_bloc/profile_name_bloc.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class UserNameDisaply extends StatelessWidget {
  const UserNameDisaply({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileNameBloc, ProfileNameState>(
      builder: (context, state) {
        return Center(
          child: myFont(state.name.toUpperCase(),
              fontFamily: bebasNeue,
              fontSize: mediaqueryHeight(0.028, context),
              fontWeight: FontWeight.normal,
              fontColor: whiteColor),
        );
      },
    );
  }
}