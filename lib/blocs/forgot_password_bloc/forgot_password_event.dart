part of 'forgot_password_bloc.dart';

@immutable
sealed class ForgotPasswordEvent {}

final class SendEmailButtonPressedFromForgetPassword
    extends ForgotPasswordEvent {
  final BuildContext context;

  SendEmailButtonPressedFromForgetPassword({required this.context});
}
