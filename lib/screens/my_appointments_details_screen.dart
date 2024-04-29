import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/models/bookings_model.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/widgets/appointments_details/back_button.dart';
import 'package:trim_spot_user_side/widgets/appointments_details/detailed_display_container.dart';
import 'package:trim_spot_user_side/widgets/appointments_details/details_heading.dart';
import 'package:trim_spot_user_side/widgets/appointments_details/review_or_cancel_button.dart';
import 'package:trim_spot_user_side/widgets/appointments_details/service_image.dart';
import 'package:trim_spot_user_side/widgets/appointments_details/status_and_service_stack.dart';

class MyAppointmentsDetailsScreen extends StatelessWidget {
  const MyAppointmentsDetailsScreen({super.key, required this.bookingModel});
  final BookingsModel bookingModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SingleChildScrollView(
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
                  ServiceImage(bookingModel: bookingModel),
                  const BackButtonBookinDetails(),
                  StatusAndService(bookingModel: bookingModel)
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
            detailsDisplayArea(context, bookingModel),
            SizedBox(
              height: mediaqueryHeight(0.065, context),
            ),
            if (bookingModel.status != "cancelled")
              rateOrCancel(context, bookingModel)
          ],
        )),
      ),
    );
  }
}
