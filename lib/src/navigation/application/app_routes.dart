import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/bible/presentation/screens/bible_screen.dart';
import '../data/app_route.dart';
import '../domain/base_routes.dart';

/// The apps routes
class AppRoutes extends BaseRoutes {
  AppRoutes(super.rootNavigatorKey);

  /// Create the apps routes
  ///
  /// Returns a list of routes
  @override
  List<RouteBase> create() {
    final routes = <RouteBase>[
      _rootChildBuilder(AppRoute.bible, const BibleScreen()),
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
}
