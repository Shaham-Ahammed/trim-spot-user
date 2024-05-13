import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/blocs/cancel_booking_bloc/cancel_booking_bloc_bloc.dart';
import 'package:trim_spot_user_side/blocs/review_and_rating/review_and_rating_bloc.dart';
import 'package:trim_spot_user_side/screens/bottom_navigation.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/page%20transitions/no_transition_page_route.dart';
import 'package:trim_spot_user_side/utils/snack_bars.dart';
import 'package:trim_spot_user_side/widgets/appointments_details/cancel_alert.dart';
import 'package:trim_spot_user_side/widgets/appointments_details/cannot_cancel_alert.dart';
import 'package:trim_spot_user_side/widgets/appointments_details/review_box.dart';
import 'package:trim_spot_user_side/widgets/login_page_widgets/loading_indicator.dart';

class MyAppointementStateHandler{
  static void handleStateOfCancellation(BuildContext context,CancelBookingBlocState state,QueryDocumentSnapshot<Object?> booking){
      if (state is ShowCannotCancelAlert) {
              cannotCancelAlertDialogue(context);
            }
            if (state is ShowCancellationAlertDialogue) {
              cancelAlertDialogue(context, booking);
            }
            if (state is LoadingCancellation) {
              loadingIndicator(context);
            }
            if (state is CancellationCompleted) {
              Navigator.of(context).pushAndRemoveUntil(
                  NoTransitionPageRoute(
                      child: const BottomNavigationBarScreen()),
                  (route) => false);
            }
            if (state is CancellationFailed) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                  errorSnackBar("cancellation failed!. please try again"));
            }
  }
 static void handleStateOfRateAndReview(BuildContext context,ReviewAndRatingState state,QueryDocumentSnapshot<Object?> booking){
    if (state is ReviewSuccessfullySubmitted) {
              Navigator.pop(context);
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                  successSnackBar("Thank you for submitting your feedback"));
            }
            if (state is ReviewSubmissionFailed) {
              Navigator.pop(context);
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                  errorSnackBar("something went wrong! please try again"));
            }
            if (state is LoadingIndicatorReviewScreen) {
              loadingIndicator(context);
            }
            if (state is DisplayUserAlreadyRatedAlert) {
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                behavior: SnackBarBehavior.floating,
                duration: Duration(seconds: 2),
                dismissDirection: DismissDirection.horizontal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18)),
                ),
                content: Center(
                    child: Text("you have already rated for this order")),
                backgroundColor: greyColor3,
              ));
            }
            if (state is ShowRateAndReviewOption) {
              Navigator.pop(context);
              reviewDialogue(context, booking);
            }
 }
}