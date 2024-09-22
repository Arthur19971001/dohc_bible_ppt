import 'dart:math' as math;

import 'package:flutter/widgets.dart';

extension IterableWidgetX on Iterable<Widget> {
  /// Generates a list with [separator] between each element.
  List<Widget> toSeparatedList(Widget separator) {
    return List.generate(
      math.max(0, length * 2 - 1),
      (index) => index.isEven ? elementAt(index ~/ 2) : separator,
    );
  }
}
