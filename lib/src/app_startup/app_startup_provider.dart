import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_startup_provider.g.dart';

/// Provider to manage asynchronous app initialization
///
/// Based on: https://codewithandrea.com/articles/robust-app-initialization-riverpod/
@Riverpod(keepAlive: true)
Future<void> appStartup(AppStartupRef ref) async {
  ref.onDispose(() {
    // ensure dependent providers are disposed as well
    // ref.invalidate(sharedPreferencesProvider);
  });

  // App initialization code
  await Future.wait<void>([
    // Example. You can add more providers to wait for here
    // ref.watch(sharedPreferencesProvider.future),

    // Uncomment to simulate a longer startup time
    // Future.delayed(const Duration(seconds: 3)),
  ]);
}
