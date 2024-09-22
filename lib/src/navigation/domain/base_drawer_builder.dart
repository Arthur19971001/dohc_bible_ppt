import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'drawer_item.dart';

/// The base class for the drawer builder
class BaseDrawerBuilder {
  final BuildContext context;

  BaseDrawerBuilder(this.context);

  Widget build(List<DrawerItem> items) {
    return NavigationDrawer(
      selectedIndex: null,
      onDestinationSelected: (index) async =>
          context.pushNamed(items[index].routeName),
      children: [
        const SafeArea(
          child: DrawerHeader(
            child: CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
        ),
        const ListTile(
          dense: true,
          title: Text('Drawer Navigation'),
        ),
        ..._buildDrawerItems(items),
      ],
    );
  }

  List<NavigationDrawerDestination> _buildDrawerItems(
      List<DrawerItem> drawerItems) {
    final List<NavigationDrawerDestination> drawerDestinations = [];
    for (final DrawerItem item in drawerItems) {
      drawerDestinations.add(
        NavigationDrawerDestination(
          selectedIcon: Icon(
            item.selectedIcon,
          ),
          icon: Icon(
            item.unselectedIcon,
          ),
          label: Text(item.label),
        ),
      );
    }
    return drawerDestinations;
  }
}
