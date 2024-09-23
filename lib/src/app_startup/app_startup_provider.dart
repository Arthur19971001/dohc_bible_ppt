import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../bible_db_provider.dart';

part 'app_startup_provider.g.dart';

/// Provider to manage asynchronous app initialization
///
/// Based on: https://codewithandrea.com/articles/robust-app-initialization-riverpod/
@Riverpod(keepAlive: true)
Future<void> appStartup(AppStartupRef ref) async {
  ref.onDispose(() {
    // ensure dependent providers are disposed as well
    ref.invalidate(bibleDbProviderProvider);
  });

  // App initialization code
  await Future.wait<void>([
    ref.watch(bibleDbProviderProvider.future),
  ]);
}
