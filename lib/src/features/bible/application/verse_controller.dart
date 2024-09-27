import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../contents.dart';
import '../data/bible_repository.dart';
import '../domain/domain.dart';
import 'ppt_controller.dart';

part 'verse_controller.g.dart';

@riverpod
class VerseController extends _$VerseController {
  late final BibleRepository _bibleRepository;

  @override
  FutureOr<List<Verse>> build() async {
    _bibleRepository = ref.watch(bibleRepositoryProvider);
    return [];
  }

  Future<void> findByChapter(Bible bible, int firstCnum, int firstVnum,
      int lastCnum, int lastVnum) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final gaeVerses = await _bibleRepository.findByChapter(
          'GAE', bible.bcode, firstCnum, firstVnum, lastCnum, lastVnum);
      final nivVerses = await _bibleRepository.findByChapter(
          'NIV', bible.bcode, firstCnum, firstVnum, lastCnum, lastVnum);

      final fileName = generatedFileName(bible.name, gaeVerses);

      await ref
          .read(pptControllerProvider.notifier)
          .generatePpt(fileName, gaeVerses, nivVerses);

      return [...gaeVerses, ...nivVerses];
    });
  }

  Future<void> findByUserType(String customSearch) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final convertList = customSearch.trim().split(',');

      final List<Verse> gaeVerses = [];
      final List<Verse> nivVerses = [];
      for (final list in convertList) {
        final verse = list.trim().split(' ');

        final bible = (await _bibleRepository.searchBiblesByName(verse[0]))[0];

        late final int firstCnum;
        late final int firstVnum;
        late final int lastCnum;
        late final int lastVnum;

        if (verse[1].trim().contains('-')) {
          final convertVerses = verse[1].trim().split('-');
          firstCnum = int.parse(convertVerses[0].split(':')[0]);
          lastCnum = int.parse(convertVerses[1].contains(':')
              ? convertVerses[1].split(':')[0]
              : convertVerses[0].split(':')[0]);
          firstVnum = int.parse(convertVerses[0].split(':')[1]);
          lastVnum = int.parse(convertVerses[1].contains(':')
              ? convertVerses[1].split(':')[1]
              : convertVerses[1]);
        } else {
          firstCnum = int.parse(verse[1].split(':')[0]);
          lastCnum = int.parse(verse[1].split(':')[0]);
          firstVnum = int.parse(verse[1].split(':')[1]);
          lastVnum = int.parse(verse[1].split(':')[1]);
        }

        final findGaeVerses = await _bibleRepository.findByChapter(
            'GAE', bible.bcode, firstCnum, firstVnum, lastCnum, lastVnum);
        final findNivVerses = await _bibleRepository.findByChapter(
            'NIV', bible.bcode, firstCnum, firstVnum, lastCnum, lastVnum);

        gaeVerses.addAll(findGaeVerses);
        nivVerses.addAll(findNivVerses);
      }

      await ref
          .read(pptControllerProvider.notifier)
          .generatePpt('$customSearch.pptx', gaeVerses, nivVerses);
      return [...gaeVerses, ...nivVerses];
    });
  }
}
