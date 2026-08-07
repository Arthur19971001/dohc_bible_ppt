// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_startup_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider to manage asynchronous app initialization
///
/// Based on: https://codewithandrea.com/articles/robust-app-initialization-riverpod/

@ProviderFor(appStartup)
final appStartupProvider = AppStartupProvider._();

/// Provider to manage asynchronous app initialization
///
/// Based on: https://codewithandrea.com/articles/robust-app-initialization-riverpod/

final class AppStartupProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// Provider to manage asynchronous app initialization
  ///
  /// Based on: https://codewithandrea.com/articles/robust-app-initialization-riverpod/
  AppStartupProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'appStartupProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$appStartupHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return appStartup(ref);
  }
}

String _$appStartupHash() => r'7bc42b0adcc139e9cb3042f29ec2aaa8b9d8fe99';
