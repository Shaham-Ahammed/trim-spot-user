part of 'onboardind_bloc_bloc.dart';

@immutable
sealed class OnboardindBlocState {}

final class OnboardindBlocInitial extends OnboardindBlocState {}

final class NavigateToSecondOnBoardingPage extends OnboardindBlocState{}

final class NavigateToLoginOrSignupPage extends OnboardindBlocState{} 

final class NavigateToLogin extends OnboardindBlocState{}

final class NavigateToSignUp extends OnboardindBlocState{}