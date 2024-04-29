part of 'google_sign_in_bloc.dart';

@immutable
sealed class GoogleSignInState {}

final class GoogleSignInInitial extends GoogleSignInState {}

final class GoogleSigninSuccess extends GoogleSignInState{}

final class ProcessingLogin extends GoogleSignInState{}

final class FailedGoogleSignIn extends GoogleSignInState{}