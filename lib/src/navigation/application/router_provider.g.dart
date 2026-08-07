// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(router)
final routerProvider = RouterProvider._();

final class RouterProvider extends $FunctionalProvider<
    RouterConfig<Object>?,
    RouterConfig<Object>?,
    RouterConfig<Object>?> with $Provider<RouterConfig<Object>?> {
  RouterProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'routerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$routerHash();

  @$internal
  @override
  $ProviderElement<RouterConfig<Object>?> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RouterConfig<Object>? create(Ref ref) {
    return router(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RouterConfig<Object>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RouterConfig<Object>?>(value),
    );
  }
}

String _$routerHash() => r'ecfad9944f343e1028db9b9b85adcb056689fa5e';
