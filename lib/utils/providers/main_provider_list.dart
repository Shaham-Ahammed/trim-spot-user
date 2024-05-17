import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/cancel_booking_bloc/cancel_booking_bloc_bloc.dart';
import 'package:trim_spot_user_side/blocs/booking_completion_bloc/booking_service_bloc.dart';
import 'package:trim_spot_user_side/blocs/bookmark_animation_bloc/book_mark_animation_bloc.dart';
import 'package:trim_spot_user_side/blocs/bottom_nav_bloc/bottom_navigation_bloc.dart';
import 'package:trim_spot_user_side/blocs/google_sign_in_bloc/google_sign_in_bloc.dart';
import 'package:trim_spot_user_side/blocs/location_permission_bloc/location_permission_bloc.dart';
import 'package:trim_spot_user_side/blocs/login_validation/login_validation_bloc.dart';
import 'package:trim_spot_user_side/blocs/nearby_salons_bloc/nearby_salons_bloc.dart';
import 'package:trim_spot_user_side/blocs/on_boarding_bloc/onboardind_bloc_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/name_bloc/profile_name_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/phone_bloc/profile_phone_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/profile_password_bloc/profile_password_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/user_profile_image_bloc/profile_user_image_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_image_bloc/profile_image_bloc.dart';
import 'package:trim_spot_user_side/blocs/review_and_rating/review_and_rating_bloc.dart';
import 'package:trim_spot_user_side/blocs/search_bloc/search_bloc.dart';
import 'package:trim_spot_user_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_user_side/blocs/user_form_validation/form_validation_bloc.dart';

List<BlocProvider> mainProviders = [
  BlocProvider<SearchBloc>(create: (context) => SearchBloc()),
  BlocProvider<ReviewAndRatingBloc>(create: (context) => ReviewAndRatingBloc()),
  BlocProvider<CancelBookingBloc>(create: (context) => CancelBookingBloc()),
  BlocProvider<BookingCompletionBloc>(
      create: (context) => BookingCompletionBloc()),
  BlocProvider<ProfilePasswordBloc>(create: (context) => ProfilePasswordBloc()),
  BlocProvider<UserDetailsBloc>(create: (context) => UserDetailsBloc()),
  BlocProvider<LocationPermissionBloc>(
      create: (context) => LocationPermissionBloc()),
  BlocProvider<BookMarkAnimationBloc>(
      create: (context) => BookMarkAnimationBloc()),
  BlocProvider<ProfileNameBloc>(create: (context) => ProfileNameBloc()),
  BlocProvider<ProfilePhoneBloc>(create: (context) => ProfilePhoneBloc()),
  BlocProvider<ProfileUserImageBloc>(
      create: (context) => ProfileUserImageBloc()),
  BlocProvider<NearbySalonsBloc>(create: (context) => NearbySalonsBloc()),
  BlocProvider<BottomNavigationBloc>(
      create: (context) => BottomNavigationBloc()),
  BlocProvider<GoogleSignInBloc>(create: (context) => GoogleSignInBloc()),
  BlocProvider<LoginValidationBloc>(create: (context) => LoginValidationBloc()),
  BlocProvider<FormValidationBloc>(create: (context) => FormValidationBloc()),
  BlocProvider<ProfileImageBloc>(create: (context) => ProfileImageBloc()),
  BlocProvider<OnboardindBloc>(create: (context) => OnboardindBloc())
];
