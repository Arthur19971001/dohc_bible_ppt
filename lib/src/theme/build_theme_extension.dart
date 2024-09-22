import 'package:flutter/material.dart';

/// Provides various getters to replace `Theme.of(context)` with `context.thing`
///
/// {@category Theme}
extension BuildContextThemeExtensions on BuildContext {
  /// Get the [ColorScheme]
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Get the [InputDecorationTheme]
  InputDecorationTheme get inputDecorationTheme =>
      Theme.of(this).inputDecorationTheme;

  /// Get the [TextTheme]
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Get the [ThemeData]
  ThemeData get theme => Theme.of(this);
}
