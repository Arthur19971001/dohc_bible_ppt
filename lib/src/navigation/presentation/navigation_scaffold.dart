import 'package:flutter/material.dart';

import '../domain/base_bottom_navigation_builder.dart';
import '../domain/base_navigation_rail_builder.dart';


/// A scaffold that provides a navigation rail for wide screens and a bottom navigation for narrow screens
/// 
/// The [currentRouteName] is used to determine the selected item in the navigation rail and bottom navigation
/// Use for screens that require a navigation rail and bottom navigation
class NavigationScaffold extends StatelessWidget {
  final String currentRouteName;
  final Widget? drawer;
  final List<Widget> actions;
  final BaseBottomNavigationBuilder bottomNavigationBuilder;
  final BaseNavigationRailBuilder navigationRailBuilder;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget body;

  const NavigationScaffold({
    super.key,
    required this.currentRouteName,
    this.drawer,
    this.actions = const [],
    required this.bottomNavigationBuilder,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    required this.body,
    required this.navigationRailBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final label = bottomNavigationBuilder.getLabel(currentRouteName);
    final isNarrowScreen = MediaQuery.of(context).size.width < 800;

    return Scaffold(
      appBar: AppBar(
        title: Text(label),
        actions: actions,
      ),
      body: isNarrowScreen
          ? body
          : Row(
              children: [
                navigationRailBuilder.build(context, currentRouteName)!,
                Expanded(child: body),
              ],
            ),
      drawer: drawer,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: isNarrowScreen
          ? bottomNavigationBuilder.build(context, currentRouteName)
          : null,
    );
  }
}
