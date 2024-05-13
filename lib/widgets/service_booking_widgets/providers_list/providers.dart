import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/service_booking_blocs/date_selection_bloc/date_selection_bloc.dart';
import 'package:trim_spot_user_side/blocs/service_booking_blocs/service_selected_bloc/service_selected_bloc.dart';
import 'package:trim_spot_user_side/blocs/slot_selection_bloc/slot_selection_bloc.dart';

final List<BlocProvider> blocProvidersOfBookingScreen = [
  BlocProvider<SlotSelectionBloc>(create: (context) => SlotSelectionBloc()),
  BlocProvider<DateSelectionBloc>(create: (context) => DateSelectionBloc()),
  BlocProvider<ServiceSelectedBloc>(create: (context) => ServiceSelectedBloc()),
];