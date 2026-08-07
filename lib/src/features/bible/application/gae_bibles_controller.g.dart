// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gae_bibles_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GaeBiblesContorller)
final gaeBiblesContorllerProvider = GaeBiblesContorllerProvider._();

final class GaeBiblesContorllerProvider
    extends $AsyncNotifierProvider<GaeBiblesContorller, List<Bible>> {
  GaeBiblesContorllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'gaeBiblesContorllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$gaeBiblesContorllerHash();

  @$internal
  @override
  GaeBiblesContorller create() => GaeBiblesContorller();
}

String _$gaeBiblesContorllerHash() =>
    r'c466b31659fbe71f5986e56707d7b88933e1c1be';

abstract class _$GaeBiblesContorller extends $AsyncNotifier<List<Bible>> {
  FutureOr<List<Bible>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Bible>>, List<Bible>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<Bible>>, List<Bible>>,
        AsyncValue<List<Bible>>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
