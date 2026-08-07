// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_filter_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OptionFilterController)
final optionFilterControllerProvider = OptionFilterControllerProvider._();

final class OptionFilterControllerProvider
    extends $NotifierProvider<OptionFilterController, OptionFilter> {
  OptionFilterControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'optionFilterControllerProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$optionFilterControllerHash();

  @$internal
  @override
  OptionFilterController create() => OptionFilterController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OptionFilter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OptionFilter>(value),
    );
  }
}

String _$optionFilterControllerHash() =>
    r'3aa67cd3444e229cf2c76ec77d502a2d8197f7ed';

abstract class _$OptionFilterController extends $Notifier<OptionFilter> {
  OptionFilter build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<OptionFilter, OptionFilter>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<OptionFilter, OptionFilter>,
        OptionFilter,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
