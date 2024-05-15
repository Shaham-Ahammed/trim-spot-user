import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/blocs/booking_completion_bloc/booking_service_bloc.dart';
import 'package:trim_spot_user_side/screens/booking_failure.dart';
import 'package:trim_spot_user_side/screens/booking_success.dart';
import 'package:trim_spot_user_side/utils/page%20transitions/no_transition_page_route.dart';
import 'package:trim_spot_user_side/widgets/login_page_widgets/loading_indicator.dart';

class BookingStateHandler {
  static void handleState(BuildContext context, BookingCompletionState state) {
    if (state is LoadingIndicatorOnBookingScreen) {
      loadingIndicator(context);
    }
    if (state is BookingSuccessfullyCompleted) {
     Navigator.pop(context);
      Navigator.pop(context);
      Navigator.of(context).pushReplacement(
          NoTransitionPageRoute(child: const BookingSuccessMessageScreen()));
    }
    if (state is BookingFailed) {
      Navigator.pop(context);
      Navigator.of(context).pushReplacement(
          NoTransitionPageRoute(child: const BookingFailureMessageScreen()));
    }
  }
}
