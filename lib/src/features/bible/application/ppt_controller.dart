import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/bible_repository.dart';
import '../domain/domain.dart';

part 'ppt_controller.g.dart';

@riverpod
class PptController extends _$PptController {
  late final BibleRepository _bibleRepository;

  @override
  FutureOr<void> build() {
    _bibleRepository = ref.watch(bibleRepositoryProvider);
  }

  Future<void> generatePpt(
      String fileName, List<Verse> gaeVerses, List<Verse> nivVerses) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _bibleRepository.generatePpt(gaeVerses, nivVerses, fileName);
    });
  }
}
