import 'package:flutter/material.dart';

/// Drawer item model
class DrawerItem {
  final IconData unselectedIcon;
  final IconData selectedIcon;
  final String label;
  final String routeName;

  const DrawerItem({
    required this.unselectedIcon,
    required this.selectedIcon,
    required this.label,
    required this.routeName,
  });
}
