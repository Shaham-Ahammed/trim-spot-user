part of 'forgot_password_bloc.dart';

@immutable
sealed class ForgotPasswordState {}

final class ForgotPasswordInitial extends ForgotPasswordState {}

final class EmailSendingSuccessfull extends ForgotPasswordState {}

final class UserNotRegistered extends ForgotPasswordState {}

final class SomethingWentWrong extends ForgotPasswordState {}

final class LoadingIndicatorOnForgotPassword extends ForgotPasswordState {}
