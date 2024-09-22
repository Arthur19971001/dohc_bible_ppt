import 'package:flutter/material.dart';

/// Provides a wrapper for tests that require a MaterialApp.
class TestWrapper extends StatelessWidget {
  final Widget child;
  const TestWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: child),
    );
  }
}
