import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/login_validation/login_validation_bloc.dart';
import 'package:trim_spot_user_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_user_side/blocs/user_form_validation/form_validation_bloc.dart';
import 'package:trim_spot_user_side/screens/bottom_navigation.dart';
import 'package:trim_spot_user_side/utils/page%20transitions/no_transition_page_route.dart';
import 'package:trim_spot_user_side/utils/snack_bars.dart';
import 'package:trim_spot_user_side/widgets/login_page_widgets/loading_indicator.dart';
import 'package:trim_spot_user_side/widgets/login_page_widgets/success_snackbar.dart';

class OtpVerificationStateHandler{
  static void handleStateOfRegistration(BuildContext context, FormValidationState state){
      if (state is NavigateToHomePage) {
                context.read<UserDetailsBloc>().add(FetchingUserDetailsFromFirebase());
              loginSuccessSnackBar(context).show(context);
            }
            if (state is EmailVerificationFailedFromOtpPage) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context)
                  .showSnackBar(errorSnackBar("otp verification failed"));
            }

            if (state is RegisrationFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(errorSnackBar(state.exception));
            }
  }
  static void handleStateOfLogin(BuildContext context,LoginValidationState state){
     if (state is NavigateToHomePage) {
              context
                  .read<UserDetailsBloc>()
                  .add(FetchingUserDetailsFromFirebase());
              Navigator.pop(context);
              Navigator.of(context).pushAndRemoveUntil(
                NoTransitionPageRoute(
                  child: const BottomNavigationBarScreen(),
                ),
                (route) => false,
              );
              loginSuccessSnackBar(context).show(context);
            }
            if (state is EmailVerificationFailedFromLoginOtpPage) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(errorSnackBar("otp verification failed"));
            }
            if (state is LoadingStateLogin) {
              loadingIndicator(context);
            }
  }
}