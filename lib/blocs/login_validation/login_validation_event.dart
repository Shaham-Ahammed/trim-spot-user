part of 'login_validation_bloc.dart';

@immutable
sealed class LoginValidationEvent {}

final class LoginButtonPressed extends LoginValidationEvent {
 

}
final class VerifyEmailPressedFromLogin extends LoginValidationEvent {
  final BuildContext context;

  VerifyEmailPressedFromLogin(this.context);
}

final class ResendEmailButtonPressedFromLogin extends LoginValidationEvent {}