part of 'form_validation_bloc.dart';

@immutable
sealed class FormValidationState {}

final class FormValidationInitial extends FormValidationState {}

final class NavigateToEmailVerficationPage extends FormValidationState {}

final class LoadingState extends FormValidationState {}

final class LoadingStateOtpScreen extends FormValidationState {}

final class NetworkError extends FormValidationState {}

final class UserNameExists extends FormValidationState {}

final class NavigateToHomePage extends FormValidationState {}

final class RegisrationFailure extends FormValidationState {
 final  String exception;

  RegisrationFailure( this.exception);
}
