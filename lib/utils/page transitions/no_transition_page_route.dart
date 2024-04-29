import 'package:flutter/material.dart';

class NoTransitionPageRoute extends MaterialPageRoute {
  final Widget child;
  
  NoTransitionPageRoute({required this.child})
      : super(builder: (context) => child);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
   
    return child;
  }
}