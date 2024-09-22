import 'package:flutter/material.dart';

import '../theme/layout.dart';

/// A class that provides a set of methods to show snack bars.
///
/// Customize and or copy for apps specific needs.
/// https://docs.flutter.dev/cookbook/design/snackbars
/// https://docs.flutter.dev/release/breaking-changes/scaffold-messenger
class SnackBars {
  final BuildContext _context;

  SnackBars(this._context);

  SnackBars.of(BuildContext context) : this(context);

  void hideCurrent() {
    ScaffoldMessenger.of(_context).hideCurrentSnackBar();
  }

  void showAction(
    String message,
    String actionLabel,
    VoidCallback action,
  ) {
    ScaffoldMessenger.of(_context).showSnackBar(
      SnackBar(
        padding: smallEdgeInsets,
        margin: smallEdgeInsets,
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(
          borderRadius: smallBorderRadius,
        ),
        content: Text(message),
        action: SnackBarAction(
          label: actionLabel,
          onPressed: action,
        ),
      ),
    );
  }

  void showInfo(String message) {
    ScaffoldMessenger.of(_context).showSnackBar(
      SnackBar(
        showCloseIcon: true,
        padding: smallEdgeInsets,
        margin: smallEdgeInsets,
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(borderRadius: smallBorderRadius),
        content: Text(message),
      ),
    );
  }
}
