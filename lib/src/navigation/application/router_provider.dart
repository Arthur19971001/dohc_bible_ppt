import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app_startup/app_startup_provider.dart';
import '../../app_startup/app_startup_widget.dart';
import 'app_routes.dart';

part 'router_provider.g.dart';

const _startupRoutePath = '/';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final _startupRoute = GoRoute(
  path: _startupRoutePath,
  pageBuilder: (context, state) => NoTransitionPage(
    child: AppStartupWidget(
      onLoaded: (_) => const SizedBox.shrink(),
    ),
  ),
);

@riverpod
RouterConfig<Object>? router(RouterRef ref) {
  final appStartupState = ref.watch(appStartupProvider);

  if (appStartupState.isLoading || appStartupState.hasError) {
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      debugLogDiagnostics: true,
      routes: [_startupRoute],
    );
  }

  final routes = AppRoutes(_rootNavigatorKey).create();

  final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      ...routes,
    ],
  );
  return router;
}
