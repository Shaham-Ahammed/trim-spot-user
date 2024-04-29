import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/location_permission_bloc/location_permission_bloc.dart';
import 'package:trim_spot_user_side/screens/booking_success.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/error_snackbars.dart';
import 'package:trim_spot_user_side/utils/home/scaffold_key.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/page%20transitions/no_transition_page_route.dart';
import 'package:trim_spot_user_side/utils/screen_padding.dart';
import 'package:trim_spot_user_side/widgets/home_widgets/app_bar.dart';
import 'package:trim_spot_user_side/widgets/home_widgets/category_items.dart';
import 'package:trim_spot_user_side/widgets/home_widgets/drawer.dart';
import 'package:trim_spot_user_side/widgets/home_widgets/headings.dart';
import 'package:trim_spot_user_side/widgets/home_widgets/nearbysalon_listtile.dart';
import 'package:trim_spot_user_side/widgets/home_widgets/search_box.dart';
import 'package:trim_spot_user_side/widgets/home_widgets/viewmore_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<LocationPermissionBloc>().add(GetLocationPermission());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationPermissionBloc, LocationPermissionState>(
      listener: (context, state) {
        if (state is LocationServiceNotEnabled) {
          ScaffoldMessenger.of(context)
              .showSnackBar(errorSnackBar("Please enable location permission"));
        }
      },
      child: Scaffold(
          key: homeScaffoldKey,
          drawer: Drawer(
            backgroundColor: blackColor,
            width: mediaqueryWidth(0.85, context),
            child: const DrawerItems(),
          ),
          backgroundColor: blackColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: commonScreenPadding(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppBarElements(),
                    SizedBox(
                      height: mediaqueryHeight(0.03, context),
                    ),
                    GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            NoTransitionPageRoute(
                                child: const BookingFailureMessageScreen())),
                        child: const SearchBox()),
                    SizedBox(
                      height: mediaqueryHeight(0.02, context),
                    ),
                    categoriesHeading(context),
                    SizedBox(
                      height: mediaqueryHeight(0.015, context),
                    ),
                    firstThreeCategories(context),
                    SizedBox(
                      height: mediaqueryHeight(0.01, context),
                    ),
                    secongThreeCategories(context),
                    SizedBox(
                      height: mediaqueryHeight(0.02, context),
                    ),
                    nearbySalonsHeading(context),
                    SizedBox(
                      height: mediaqueryHeight(0.015, context),
                    ),
                    const NearbySalonsListviewWidget(),
                    const ViewMoreButton()
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
