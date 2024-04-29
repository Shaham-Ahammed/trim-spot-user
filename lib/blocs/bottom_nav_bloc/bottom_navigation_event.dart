part of 'bottom_navigation_bloc.dart';

@immutable
sealed class BottomNavigationEvent {}

final class BottomNavBarPressed extends BottomNavigationEvent {
  final int currentPage;

  BottomNavBarPressed({required this.currentPage});
}
