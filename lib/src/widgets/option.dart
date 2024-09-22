import 'package:flutter/widgets.dart';

/// A value widget option
///
/// Use to hold input selection options.
/// Such as ToggleButtons, and Dropdowns
@immutable
class Option<T> {
  final T value;
  final Widget widget;

  const Option({required this.widget, required this.value});

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(covariant Option<T> other) {
    if (identical(this, other)) return true;

    return other.value == value;
  }
}
