 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/email_bloc/profile_email_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/name_bloc/profile_name_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/phone_bloc/profile_phone_bloc.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

 userPhone(BuildContext context) {
   return myFont(
                            BlocProvider.of<ProfilePhoneBloc>(context)
                                .state
                                .phone,
                            fontFamily: balooChettan,
                            fontSize: mediaqueryHeight(0.016, context),
                            fontWeight: FontWeight.w400,
                            fontColor: greyColor);
  }

  userEmail(BuildContext context) {
   return myFont(
                            BlocProvider.of<ProfileEmailBloc>(context)
                                .state
                                .email
                                .toLowerCase(),
                            fontFamily: balooChettan,
                            fontSize: mediaqueryHeight(0.016, context),
                            fontWeight: FontWeight.w400,
                            fontColor: greyColor);
  }

  userName(BuildContext context) {
  return  myFont(
                            BlocProvider.of<ProfileNameBloc>(context)
                                .state
                                .name
                                .toUpperCase(),
                            fontFamily: belleza,
                            fontSize: mediaqueryHeight(0.026, context),
                            fontWeight: FontWeight.w600,
                            fontColor: whiteColor);
  }

 