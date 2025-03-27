import 'package:flutter/material.dart';

class SlidePageRoute extends PageRouteBuilder {
  final Widget page;
  final AxisDirection direction;

  SlidePageRoute({required this.page, this.direction = AxisDirection.right})
    : super(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const beginOffset = {
            AxisDirection.right: Offset(1.0, 0.0),
            AxisDirection.left: Offset(-1.0, 0.0),
            AxisDirection.up: Offset(0.0, 1.0),
            AxisDirection.down: Offset(0.0, -1.0),
          };

          Offset begin = beginOffset[direction]!;
          Offset end = Offset.zero;
          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: Curves.easeInOut));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );
}
