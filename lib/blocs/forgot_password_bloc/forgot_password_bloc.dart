
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/data/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:trim_spot_user_side/utils/forgot_password/formkey.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitial()) {
    on<SendEmailButtonPressedFromForgetPassword>(
        _sendEmailButtonPressedFromForgetPassword);
  }
  _sendEmailButtonPressedFromForgetPassword(
      SendEmailButtonPressedFromForgetPassword event,
      Emitter<ForgotPasswordState> emit) async {
    if (forgotPasswordFormKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      emit(LoadingIndicatorOnForgotPassword());
      final emailSendResult =
          await FirebaseAuthService().sendPasswordResetLink();

      if (emailSendResult == "notRegistered") {
        emit(UserNotRegistered());
      } else if (emailSendResult == "failure" ||
          emailSendResult == "somethingwentwrong") {
        emit(SomethingWentWrong());
      } else if (emailSendResult == "success") {
        emit(EmailSendingSuccessfull());
      }
    } else {
      return;
    }
  }
}
