import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/login_validation/login_validation_bloc.dart';
import 'package:trim_spot_user_side/blocs/user_form_validation/form_validation_bloc.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

import 'package:trim_spot_user_side/utils/submit_button.dart';

submitButton(BuildContext context, bool fromLogin) {
  return submitButtonCyan(context, function: () {
    fromLogin
        ? context.read<LoginValidationBloc>().add(VerifyEmailPressedFromLogin(context))
        : context.read<FormValidationBloc>().add(VerifyEmailPressed(context));
    return null;
  },
      heigh: mediaqueryHeight(0.044, context),
      text: "continue",
      fontSize: mediaqueryHeight(0.023, context),
      width: mediaqueryWidth(0.4, context));
}
