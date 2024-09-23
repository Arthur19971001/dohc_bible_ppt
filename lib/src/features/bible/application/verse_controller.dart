import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/bible_repository.dart';
import '../domain/domain.dart';

part 'verse_controller.g.dart';

@riverpod
class VerseController extends _$VerseController {
  late final BibleRepository _bibleRepository;

  @override
  FutureOr<List<Verse>> build() async {
    _bibleRepository = ref.watch(bibleRepositoryProvider);
    return [];
  }

  Future<void> findByChapter(int bcode, int firstCnum,
      int firstVnum, int lastCnum, int lastVnum) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final gaeVerses = await _bibleRepository.findByChapter('GAE',bcode, firstCnum, firstVnum, lastCnum, lastVnum);
      final nivVerses = await _bibleRepository.findByChapter('NIV', bcode, firstCnum, firstVnum, lastCnum, lastVnum);
  
      await _bibleRepository.generatePpt(gaeVerses, nivVerses);
      return gaeVerses;
    });
  }
}
