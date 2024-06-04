part of 'form_validation_bloc.dart';

@immutable
sealed class FormValidationEvent {}

final class SubmitButtonPressed extends FormValidationEvent {
  final BuildContext context;
  SubmitButtonPressed(this.context);
}

final class VerifyEmailPressed extends FormValidationEvent {
  final BuildContext context;

  VerifyEmailPressed(this.context);
}

final class ResendEmailButtonPressed extends FormValidationEvent {}

final class AuthenticateUserDetails extends FormValidationEvent {
  final BuildContext context;

  AuthenticateUserDetails(this.context);
}

final class OtpValidation extends FormValidationEvent {
  final BuildContext context;

  OtpValidation({required this.context});
}

final class SubmitOtpButtonPressed extends FormValidationEvent {
  final String verificationId;
  final BuildContext context;
  SubmitOtpButtonPressed({required this.verificationId, required this.context});
}
