// Flutter imports:
import 'package:flutter/material.dart';

class RemoveScrollEffectBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}

class RemoveScrollEffect extends StatelessWidget {
  final Widget child;

  const RemoveScrollEffect({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: RemoveScrollEffectBehaviour(),
      child: child,
    );
  }
}
