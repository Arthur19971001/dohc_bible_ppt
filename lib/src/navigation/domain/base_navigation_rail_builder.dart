import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'navigation_item.dart';

/// The base class for the navigation rail builder
class BaseNavigationRailBuilder {
  final List<NavigationItem> items;

  BaseNavigationRailBuilder(this.items);

  Widget? build(BuildContext context, String currentRouteName) {
    if (items.isEmpty) return null;

    final index = _getNavIndex(currentRouteName);

    return NavigationRail(
      destinations: _builNavigationRailItems(items),
      selectedIndex: index,
      groupAlignment: -1.0,
      labelType: NavigationRailLabelType.all,
      onDestinationSelected: (int index) {
        final navItem = items[index];
        context.goNamed(navItem.routeName);
      },
    );
  }

  List<NavigationRailDestination> _builNavigationRailItems(
    List<NavigationItem> navigationItems,
  ) {
    final List<NavigationRailDestination> navItems = [];
    for (final item in navigationItems) {
      navItems.add(
        NavigationRailDestination(
          icon: Icon(item.icon),
          label: Text(item.label),
        ),
      );
    }
    return navItems;
  }

  int _getNavIndex(String routeName) {
    final result = items.indexWhere((element) {
      return element.routeName == routeName;
    });
    return (result < 0) ? 0 : result;
  }
}
