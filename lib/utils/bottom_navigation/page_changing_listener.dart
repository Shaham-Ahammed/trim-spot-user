import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/bottom_nav_bloc/bottom_navigation_bloc.dart';

int bottomBarIconColor(context) {
  return BlocProvider.of<BottomNavigationBloc>(context, listen: true)
      .state
      .currentPageIndex;
}
