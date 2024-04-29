import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trim_spot_user_side/blocs/google_sign_in_bloc/google_sign_in_bloc.dart';

import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class GoogleSignInWidget extends StatelessWidget {
  const GoogleSignInWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(90),
      color: greyColor2,
      child: InkWell(
        borderRadius: BorderRadius.circular(90),
        onTap: () {
          context.read<GoogleSignInBloc>().add(GoogleSigninButtonPressed());
        },
        child: Container(
          height: mediaqueryHeight(0.06, context),
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/mdi--google.svg"),
              SizedBox(
                width: mediaqueryWidth(0.04, context),
              ),
              myFont("Sign in with google",
                  fontFamily: balooChettan,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontColor: blackColor)
            ],
          ),
        ),
      ),
    );
  }
}
