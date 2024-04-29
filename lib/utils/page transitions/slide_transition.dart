import 'package:flutter/material.dart';

class SlideTransitionPageRoute extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;
  SlideTransitionPageRoute({required this.child, this.direction = AxisDirection.left})
      : super(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(
        position: Tween<Offset>(
          begin: beginOffset(),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );

  Offset beginOffset() {
    switch (direction) {
      case AxisDirection.up:
        return const Offset(0, 1);
      case AxisDirection.right:
        return const Offset(-1, 0);
      case AxisDirection.left:
        return const Offset(1, 0);
      default:
        return const Offset(0, -1);
    }
  }
}
