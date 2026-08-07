// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bible_db_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bibleDbProvider)
final bibleDbProviderProvider = BibleDbProviderProvider._();

final class BibleDbProviderProvider extends $FunctionalProvider<
        AsyncValue<Database>, Database, FutureOr<Database>>
    with $FutureModifier<Database>, $FutureProvider<Database> {
  BibleDbProviderProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'bibleDbProviderProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$bibleDbProviderHash();

  @$internal
  @override
  $FutureProviderElement<Database> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Database> create(Ref ref) {
    return bibleDbProvider(ref);
  }
}

String _$bibleDbProviderHash() => r'723262c6198cf62f73c7d470469e81fcb55ea716';
