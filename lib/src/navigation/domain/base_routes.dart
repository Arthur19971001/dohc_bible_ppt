import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Base class for all routes
abstract class BaseRoutes {
  final GlobalKey<NavigatorState> rootNavigatorKey;

  const BaseRoutes(this.rootNavigatorKey);

  List<RouteBase> create() {
    return [];
  }
}
