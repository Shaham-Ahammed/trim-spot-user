part of 'google_sign_in_bloc.dart';

@immutable
sealed class GoogleSignInEvent {}

final class GoogleSigninButtonPressed extends GoogleSignInEvent {
  final BuildContext context;

  GoogleSigninButtonPressed({required this.context});
}
