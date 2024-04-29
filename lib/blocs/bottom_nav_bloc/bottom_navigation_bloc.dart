import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(const BottomNavigationInitial(currentPageIndex: 0)) {
    on<BottomNavBarPressed>(_bottomNavBarPressed);
  }
  _bottomNavBarPressed(
      BottomNavBarPressed event, Emitter<BottomNavigationState> emit) {
    emit(BottomNavigationInitial(currentPageIndex: event.currentPage));
  }
}
