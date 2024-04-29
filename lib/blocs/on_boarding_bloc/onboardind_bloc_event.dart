part of 'onboardind_bloc_bloc.dart';

@immutable
sealed class OnboardindBlocEvent {}

class NextButtonPressed extends OnboardindBlocEvent {
  final double page;
  NextButtonPressed(this.page);
}

class LoginButtonPressed extends OnboardindBlocEvent{}

class SignUpButtonPressed extends OnboardindBlocEvent{}