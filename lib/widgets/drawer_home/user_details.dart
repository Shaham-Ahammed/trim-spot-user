import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:trim_spot_user_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

userPhone(BuildContext context) {
  return myFont(context.watch<UserDetailsBloc>().state.phone,
      fontFamily: balooChettan,
      fontSize: mediaqueryHeight(0.016, context),
      fontWeight: FontWeight.w400,
      fontColor: greyColor);
}

userEmail(BuildContext context) {
  return myFont(
    context.watch<UserDetailsBloc>().state.email,
      fontFamily: balooChettan,
      fontSize: mediaqueryHeight(0.016, context),
      fontWeight: FontWeight.w400,
      fontColor: greyColor);
}

userName(BuildContext context) {
  return myFont(context.watch<UserDetailsBloc>().state.userName.toUpperCase(),
      fontFamily: belleza,
      fontSize: mediaqueryHeight(0.026, context),
      fontWeight: FontWeight.w600,
      fontColor: whiteColor);
}
