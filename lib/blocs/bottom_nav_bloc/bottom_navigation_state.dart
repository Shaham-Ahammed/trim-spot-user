part of 'bottom_navigation_bloc.dart';

@immutable
sealed class BottomNavigationState {
  final int currentPageIndex;

  const BottomNavigationState({required this.currentPageIndex});
}

final class BottomNavigationInitial extends BottomNavigationState {
  const BottomNavigationInitial({required super.currentPageIndex});
}
