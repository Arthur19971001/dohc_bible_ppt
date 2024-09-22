import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'patrol_finders.dart';
import 'test_wrapper.dart';

extension TesterExtensions on PatrolTester {
  /// Pumps a widget with a MaterialApp, Scaffold and the given widget as the body.
  Future<void> pumpWidgetWithWrapper(Widget widget) async {
    await pumpWidget(TestWrapper(child: widget));
  }
}
