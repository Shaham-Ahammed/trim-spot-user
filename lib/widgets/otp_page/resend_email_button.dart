import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/login_validation/login_validation_bloc.dart';
import 'package:trim_spot_user_side/blocs/user_form_validation/form_validation_bloc.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class ResendEmailButton extends StatelessWidget {
  const ResendEmailButton({
    super.key,
    required this.fromLogin
  });
  final bool fromLogin;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStatePropertyAll(Colors.grey.withOpacity(.2)),
        ),
        onPressed: () {
       fromLogin
        ? context.read<LoginValidationBloc>().add(ResendEmailButtonPressedFromLogin())
        : context.read<FormValidationBloc>().add(ResendEmailButtonPressed());
    return;
        },
        child: myFont("resend email",
            fontFamily: balooChettan,
            fontSize: mediaqueryHeight(0.019, context),
            fontWeight: FontWeight.normal,
            fontColor: Colors.blue.shade100));
  }
}
