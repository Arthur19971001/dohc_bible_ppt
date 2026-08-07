// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verse_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(VerseController)
final verseControllerProvider = VerseControllerProvider._();

final class VerseControllerProvider
    extends $AsyncNotifierProvider<VerseController, List<Verse>> {
  VerseControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'verseControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$verseControllerHash();

  @$internal
  @override
  VerseController create() => VerseController();
}

String _$verseControllerHash() => r'7582ad0daacef51c62f28521e60ae77803502a21';

abstract class _$VerseController extends $AsyncNotifier<List<Verse>> {
  FutureOr<List<Verse>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Verse>>, List<Verse>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<Verse>>, List<Verse>>,
        AsyncValue<List<Verse>>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
