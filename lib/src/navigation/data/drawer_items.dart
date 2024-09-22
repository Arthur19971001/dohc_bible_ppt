import 'package:flutter/material.dart';

import '../domain/drawer_item.dart';
import 'app_route.dart';

/// The apps drawer items
final List<DrawerItem> drawerItems = [
  DrawerItem(
    unselectedIcon: Icons.camera_alt_outlined,
    selectedIcon: Icons.camera_alt_rounded,
    label: 'Example',
    routeName: AppRoute.example.name,
  ),
];
