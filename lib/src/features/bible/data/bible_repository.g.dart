// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bible_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bibleRepository)
final bibleRepositoryProvider = BibleRepositoryProvider._();

final class BibleRepositoryProvider extends $FunctionalProvider<BibleRepository,
    BibleRepository, BibleRepository> with $Provider<BibleRepository> {
  BibleRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'bibleRepositoryProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$bibleRepositoryHash();

  @$internal
  @override
  $ProviderElement<BibleRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BibleRepository create(Ref ref) {
    return bibleRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BibleRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BibleRepository>(value),
    );
  }
}

String _$bibleRepositoryHash() => r'4239d3a3355bb55e2adf0396c5ac121ed0b81088';
