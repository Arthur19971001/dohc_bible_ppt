import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'navigation_item.dart';

/// The base class for the bottom navigation builder
class BaseBottomNavigationBuilder {
  final List<NavigationItem> items;

  BaseBottomNavigationBuilder(this.items);

  Widget? build(BuildContext context, String currentRouteName) {
    if (items.isEmpty) return null;

    final index = _getNavIndex(currentRouteName);

    return BottomNavigationBar(
      onTap: (index) {
        final navItem = items[index];
        context.goNamed(navItem.routeName);
      },
      currentIndex: index,
      items: _buildBottomNavigationItems(items),
    );
  }

  String getLabel(String routeName) {
    return items
        .firstWhere(
          (item) => item.routeName == routeName,
          orElse: () => items[0],
        )
        .label;
  }

  List<BottomNavigationBarItem> _buildBottomNavigationItems(
      List<NavigationItem> bottomNavigationItems) {
    final List<BottomNavigationBarItem> bottomNavItems = [];
    for (final NavigationItem item in bottomNavigationItems) {
      bottomNavItems.add(
        BottomNavigationBarItem(icon: Icon(item.icon), label: item.label),
      );
    }
    return bottomNavItems;
  }

  int _getNavIndex(String routeName) {
    final result = items.indexWhere((element) {
      return element.routeName == routeName;
    });
    return (result < 0) ? 0 : result;
  }
}
