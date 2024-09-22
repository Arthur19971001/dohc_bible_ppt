import 'package:flutter/material.dart';

/// A [PopupMenuItem] that does not handle taps.
class PopupMenuItemWithTapBlocked<T> extends PopupMenuItem<T> {
  const PopupMenuItemWithTapBlocked({
    required Widget super.child,
    super.key,
  });

  @override
  PopupMenuItemState<T, PopupMenuItem<T>> createState() => _PopupItemState();
}

class _PopupItemState<T> extends PopupMenuItemState<T, PopupMenuItem<T>> {
  @override
  void handleTap() {
    // Do nothing
  }
}
