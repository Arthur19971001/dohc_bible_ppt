# App Startup

This is based on the article: [How to Build a Robust Flutter App Initialization Flow with Riverpod](https://codewithandrea.com/articles/robust-app-initialization-riverpod/).

> Dependent on brick: https://github.com/thetanz/digital-mcoe-flutter-mason-bricks/tree/main/theme

The following is a typical setup for use inconjunction with [go_router](https://pub.dev/packages/go_router).

```dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../app_startup/app_startup_provider.dart';
import '../app_startup/app_startup_widget.dart';
import '../app_switch/app.dart';

part 'router_provider.g.dart';

const _startupRouteName = 'startup';
const _startupRoutePath = '/startup';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final _startupRoute = GoRoute(
  path: _startupRoutePath,
  name: _startupRouteName,
  pageBuilder: (context, state) => NoTransitionPage(
    child: AppStartupWidget(onLoaded: (_) => const SizedBox.shrink()),
  ),
);

@riverpod
RouterConfig<Object>? router(RouterRef ref) {
  final appStartupState = ref.watch(appStartupProvider);

  final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      // If the app is still initializing, show the /startup route
      if (appStartupState.isLoading || appStartupState.hasError) {
        return _startupRoutePath;
      }
      return null;
    },
    routes: [
      _startupRoute,
      ...routes,
    ],
  );
  return router;
}

```