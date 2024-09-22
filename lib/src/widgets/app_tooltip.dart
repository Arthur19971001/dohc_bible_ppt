import 'package:flutter/material.dart';

/// Provides a [Tooltip] widget wrapped for this apps specific needs.
/// 
/// Customize and or copy for apps specific needs.
/// Perfer customizing via the [TooltipTheme] in [ThemeData] where possible.
class AppTooltip extends StatelessWidget {
  final Widget child;
  final String message;

  const AppTooltip({
    super.key,
    required this.child,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      child: child,
    );
  }
}
