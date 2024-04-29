import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/user_form_validation/form_validation_bloc.dart';

import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/submit_button.dart';

submitButtonOtpPage(BuildContext context, String verificationId) {
  return submitButtonCyan(context, function: () {
    context.read<FormValidationBloc>().add(SubmitOtpButtonPressed(
        verificationId: verificationId, context: context));
    return null;
  },
      heigh: mediaqueryHeight(0.06, context),
      text: "submit",
      width: mediaqueryWidth(0.5, context));
}
