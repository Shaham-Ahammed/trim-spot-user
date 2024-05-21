part of 'profile_password_bloc.dart';

@immutable
sealed class ProfilePasswordEvent {}

final class SubmitButtonPressed extends ProfilePasswordEvent {
  final BuildContext context;
  final GlobalKey<FormState> formKey;
  final TextEditingController newPasswordController;
  SubmitButtonPressed(
      {required this.context,
      required this.formKey,
      required this.newPasswordController});
}

final class PressedEyeIconOnPassword extends ProfilePasswordEvent {}
