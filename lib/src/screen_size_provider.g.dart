// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_size_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(screenSizeProvider)
final screenSizeProviderProvider = ScreenSizeProviderProvider._();

final class ScreenSizeProviderProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  ScreenSizeProviderProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'screenSizeProviderProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$screenSizeProviderHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return screenSizeProvider(ref);
  }
}

String _$screenSizeProviderHash() =>
    r'084412d48996f308eced9c8e172267921e1f9955';
