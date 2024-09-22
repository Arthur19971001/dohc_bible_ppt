import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../example_navigation_feature/presentation/child_screen.dart';
import '../../example_navigation_feature/presentation/example_screen.dart';
import '../../example_navigation_feature/presentation/tab_1_screen.dart';
import '../../example_navigation_feature/presentation/tab_2_screen.dart';
import '../data/app_route.dart';
import '../data/bottom_navigation_items.dart';
import '../data/drawer_items.dart';
import '../domain/base_bottom_navigation_builder.dart';
import '../domain/base_drawer_builder.dart';
import '../domain/base_navigation_rail_builder.dart';
import '../domain/base_routes.dart';
import '../presentation/navigation_scaffold.dart';

/// The apps routes
class AppRoutes extends BaseRoutes {
  final GlobalKey<NavigatorState> _shellKey = GlobalKey<NavigatorState>();

  AppRoutes(super.rootNavigatorKey);

  /// Create the apps routes
  ///
  /// Returns a list of routes
  @override
  List<RouteBase> create() {
    final routes = <RouteBase>[
      // Add your routes builder here
      // This is example route builder to get you started
      _shellBuilder([
        _shellChildBuilder(AppRoute.tab1, const Tab1Screen(),
            [_rootChildBuilder(AppRoute.child, const ChildScreen())]),
        _shellChildBuilder(AppRoute.tab2, const Tab2Screen()),
      ]),
      _rootChildBuilder(AppRoute.example, const ExampleScreen()),
    ];

    return routes;
  }

  /// Use to create a root route
  ///
  /// Uses the [rootNavigatorKey] to create the route
  GoRoute _rootChildBuilder(
    AppRoute route,
    Widget screen, [
    List<RouteBase> routes = const [],
  ]) {
    return GoRoute(
      path: route.path,
      name: route.name,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => screen,
      routes: routes,
    );
  }

  /// Use to create a shell route
  ///
  /// Uses the [_shellKey] to create the route
  /// Typically used to wrap items of the bottom navigation or navigation rail
  ShellRoute _shellBuilder(List<GoRoute> routes) {
    return ShellRoute(
      navigatorKey: _shellKey,
      builder: (context, state, child) {
        final currentRouteName = state.topRoute?.name ?? '';
        return NavigationScaffold(
            bottomNavigationBuilder:
                BaseBottomNavigationBuilder(bottomNavigationItems),
            navigationRailBuilder:
                BaseNavigationRailBuilder(bottomNavigationItems),
            currentRouteName: currentRouteName,
            drawer: BaseDrawerBuilder(context).build(drawerItems),
            body: child);
      },
      routes: routes,
    );
  }

  /// Use to create a shell child route
  GoRoute _shellChildBuilder(
    AppRoute route,
    Widget page, [
    List<RouteBase> routes = const [],
  ]) {
    return GoRoute(
      path: route.path,
      name: route.name,
      parentNavigatorKey: _shellKey,
      builder: (context, state) => page,
      routes: routes,
    );
  }
}
