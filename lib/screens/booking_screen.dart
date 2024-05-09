import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/service_booking_blocs/date_selection_bloc/date_selection_bloc.dart';
import 'package:trim_spot_user_side/blocs/service_booking_blocs/service_selected_bloc/service_selected_bloc.dart';
import 'package:trim_spot_user_side/blocs/slot_selection_bloc/slot_selection_bloc.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/service_booking/animation_controller.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/bookmark_lottie.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/clear_selection.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/date_selection.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/headings.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/main_contianer_decoration.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/resusables.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/round_icons.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/service_selection.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/shop_image.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/shop_location.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/shop_name.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/slide_to_widget.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/slots.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/total_time.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/reviews_and_ratings/user_review.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/reviews_and_ratings/view_more_ratings_button.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/working_hours.dart';

class ServiceBookingScreen extends StatefulWidget {
  final QueryDocumentSnapshot<Object?> shop;
  const ServiceBookingScreen({super.key, required this.shop});

  @override
  State<ServiceBookingScreen> createState() => _ServiceBookingScreenState();
}

class _ServiceBookingScreenState extends State<ServiceBookingScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    bookmarkAnimationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    bookmarkAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SlotSelectionBloc()),
        BlocProvider(create: (context) => DateSelectionBloc()),
        BlocProvider(create: (context) => ServiceSelectedBloc()),
      ],
      child: Scaffold(
          backgroundColor: blackColor,
          body: SafeArea(
              child: Column(children: [
            Stack(
              children: [
                SizedBox(
                  width: mediaqueryWidth(1, context),
                  height: mediaqueryHeight(0.3, context),
                ),
                Positioned(child: ShopImageDisplay(widget.shop)),
                const BackButton(),
                const BookmarkAnimationLottie()
              ],
            ),
            shopName(context, widget.shop),
            ShopLocation(widget.shop),
            SizedBox(
              height: mediaqueryHeight(0.02, context),
            ),
            Expanded(
                child: SizedBox(
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Positioned(
                            top: mediaqueryHeight(0.033, context),
                            child: Container(
                                height: mediaqueryHeight(0.539, context),
                                width: mediaqueryWidth(1, context),
                                decoration: bigContainerDecoration(),
                                child: Padding(
                                    padding: bigContainerPadding(context),
                                    child: SingleChildScrollView(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        serviceBookingScreenHeadings(
                                            context, "WORKING HOURS"),
                                        workingHourContainerField(
                                            context, widget.shop),
                                        SizedBox(
                                          height:
                                              mediaqueryHeight(0.02, context),
                                        ),
                                        serviceBookingScreenHeadings(
                                            context, "USER REVIEWS"),
                                         UserReviews(widget.shop),
                                         ViewMoreRatingsButton(shop:widget.shop),
                                        SizedBox(
                                          height:
                                              mediaqueryHeight(0.012, context),
                                        ),
                                        serviceBookingScreenHeadings(
                                            context, "DATE"),
                                        dateSelectionContaienerField(widget.shop),
                                        servicesSection(),
                                        BlocBuilder<ServiceSelectedBloc,
                                            ServiceSelectedState>(
                                          builder: (context, state) {
                                            if (state
                                                .servicesSelected.isNotEmpty) {
                                              return Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  serviceBookingScreenHeadings(
                                                      context, "TOTAL TIME"),
                                                  totalTimeContainerField(
                                                      context),
                                                  SizedBox(
                                                    height: mediaqueryHeight(
                                                        0.012, context),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      selectSlotsHeading(
                                                          context),
                                                      const ClearSelectionHeading(),
                                                    ],
                                                  ),
                                                  slotSelectionSubtitle(
                                                      context),
                                                  SizedBox(
                                                    height: mediaqueryHeight(
                                                        0.008, context),
                                                  ),
                                                  BlocBuilder<SlotSelectionBloc,
                                                          SlotSelectionState>(
                                                      builder:
                                                          (context, state) {
                                                    final event = context.read<
                                                        SlotSelectionBloc>();
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        SlotsPickingArea(
                                                            event: event),
                                                        if (state.selectedSlots
                                                            .isNotEmpty)
                                                          const SlideToPayWidget(),
                                                      ],
                                                    );
                                                  })
                                                ],
                                              );
                                            }
                                            return Container();
                                          },
                                        )
                                      ],
                                    ))))),
                        fourRoundedIcons(context, widget.shop),
                      ],
                    )))
          ]))),
    );
  }
}
