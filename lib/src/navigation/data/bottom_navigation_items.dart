import 'package:flutter/material.dart';

import '../domain/navigation_item.dart';
import 'app_route.dart';

/// The apps bottom navigation items
final List<NavigationItem> bottomNavigationItems = [
  NavigationItem(
    icon: Icons.tab,
    label: 'Tab 1',
    routeName: AppRoute.tab1.name,
  ),
  NavigationItem(
    icon: Icons.widgets,
    label: 'Tab 2',
    routeName: AppRoute.tab2.name,
  ),
];
