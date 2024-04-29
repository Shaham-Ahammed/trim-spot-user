part of 'login_validation_bloc.dart';

@immutable
sealed class LoginValidationState {}

final class LoginValidationInitial extends LoginValidationState {}

final class LoginSuccess extends LoginValidationState {}

final class AuthenticatingUser extends LoginValidationState {}

final class IncorrectDetails extends LoginValidationState {}

final class NetworkError extends LoginValidationState {}

final class LoadingStateLogin extends LoginValidationState{}
final class EmailNotVerified extends LoginValidationState {}

final class NavigateToOtPage extends LoginValidationState {
final  User user;

  NavigateToOtPage(this.user);
}

final class EmailVerificationFailedFromOtpPage extends LoginValidationState{}