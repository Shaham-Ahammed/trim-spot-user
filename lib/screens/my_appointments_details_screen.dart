import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/cancel_booking_bloc/cancel_booking_bloc_bloc.dart';
import 'package:trim_spot_user_side/blocs/review_and_rating/review_and_rating_bloc.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/data/repository/network_stream.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/no_network.dart';
import 'package:trim_spot_user_side/widgets/appointments_details/back_button.dart';
import 'package:trim_spot_user_side/widgets/appointments_details/detailed_display_container.dart';
import 'package:trim_spot_user_side/widgets/appointments_details/details_heading.dart';
import 'package:trim_spot_user_side/widgets/appointments_details/review_or_cancel_button.dart';
import 'package:trim_spot_user_side/widgets/appointments_details/service_image.dart';
import 'package:trim_spot_user_side/widgets/appointments_details/state_handler/state_handler.dart';
import 'package:trim_spot_user_side/widgets/appointments_details/status_and_service_stack.dart';

class MyAppointmentsDetailsScreen extends StatelessWidget {
  const MyAppointmentsDetailsScreen({super.key, required this.booking});
  final QueryDocumentSnapshot<Object?> booking;
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CancelBookingBloc, CancelBookingBlocState>(
          listener: (context, state) {
            MyAppointementStateHandler.handleStateOfCancellation(
                context, state, booking);
          },
        ),
        BlocListener<ReviewAndRatingBloc, ReviewAndRatingState>(
          listener: (context, state) {
            MyAppointementStateHandler.handleStateOfRateAndReview(
                context, state, booking);
          },
        )
      ],
      child: Scaffold(
        backgroundColor: blackColor,
        body: StreamBuilder<bool>(
         stream: checkInternetconnectivity(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container();
                    }

                    if (!snapshot.data!) {
                     

                     return const  NoNetworkDisplayWidget();
                    }
            return SingleChildScrollView(
              child: SafeArea(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(mediaqueryHeight(0.01, context)),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: mediaqueryHeight(0.45, context),
                        ),
                        ServiceImage(
                          booking: booking,
                        ),
                        const BackButtonBookinDetails(),
                        StatusAndService(booking: booking)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mediaqueryHeight(0.02, context),
                  ),
                  const DetailsHeading(),
                  SizedBox(
                    height: mediaqueryHeight(0.01, context),
                  ),
                  detailsDisplayArea(context, booking),
                  SizedBox(
                    height: mediaqueryHeight(0.065, context),
                  ),
                  if (booking[BookingHisotryUserDocumentModel.currentStatus] !=
                      BookingHisotryUserDocumentModel.currentStatusCancelled)
                    rateOrCancel(context, booking)
                ],
              )),
            );
          }
        ),
      ),
    );
  }
}
