import 'package:flutter/material.dart';

/// Navigation item model
class NavigationItem {
  final IconData icon;
  final String label;
  final String routeName;

  const NavigationItem({
    required this.icon,
    required this.label,
    required this.routeName,
  });
}
