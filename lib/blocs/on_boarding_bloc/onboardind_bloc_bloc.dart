import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/data/shared_preference/functions.dart';
part 'onboardind_bloc_event.dart';
part 'onboardind_bloc_state.dart';

class OnboardindBloc extends Bloc<OnboardindBlocEvent, OnboardindBlocState> {
  OnboardindBloc() : super(OnboardindBlocInitial()) {
    on<NextButtonPressed>(_nextButtonPressed);
    on<LoginButtonPressed>(_loginButtonPressed);
    on<SignUpButtonPressed>(_signUpButtonPressed);
  }
  _nextButtonPressed(
      NextButtonPressed event, Emitter<OnboardindBlocState> emit) async {
    if (event.page == 0) {
      emit(NavigateToSecondOnBoardingPage());
    } else if (event.page == 1) {
      await SharedPreferenceOperation().settingNotAFirstTimeUser();
      emit(NavigateToLoginOrSignupPage());
    }
  }

  _loginButtonPressed(
      LoginButtonPressed event, Emitter<OnboardindBlocState> emit) {
    emit(NavigateToLogin());
  }

  _signUpButtonPressed(
      SignUpButtonPressed event, Emitter<OnboardindBlocState> emit) {
    emit(NavigateToSignUp());
  }
}
