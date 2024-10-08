import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/domain.dart';

part 'option_filter_controller.g.dart';

@Riverpod(keepAlive: true)
class OptionFilterController extends _$OptionFilterController {
  @override
  OptionFilter build() {
    return OptionFilter.initial();
  }

  void changedHasVerseName(int value) {
    state = state.copyWith(hasVerseName: value == 0);
  }

  void changeSelectedBible(int value) {
    state =
        state.copyWith(selectBibleVersion: SelectBibleVersion.values[value]);
  }
}
