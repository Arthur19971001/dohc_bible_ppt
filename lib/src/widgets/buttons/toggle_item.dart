import 'package:flutter/material.dart';

/// Provides a toggle item to be used with AppToggleButton.
@immutable
class ToggleItem {
  final bool isSelected;
  final Widget child;
  const ToggleItem(this.child, this.isSelected);

  @override
  int get hashCode => isSelected.hashCode ^ child.hashCode;

  @override
  bool operator ==(covariant ToggleItem other) {
    if (identical(this, other)) return true;

    return other.isSelected == isSelected && other.child == child;
  }
}
