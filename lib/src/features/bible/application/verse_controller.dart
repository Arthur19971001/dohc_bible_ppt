import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../contents.dart';
import '../data/bible_repository.dart';
import '../domain/domain.dart';
import 'option_filter_controller.dart';

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
      final optionFilter = ref.read(optionFilterControllerProvider);
      final gaeVerses = await _bibleRepository.findByChapter(
          'GAE', bible.bcode, firstCnum, firstVnum, lastCnum, lastVnum);
      final nivVerses = await _bibleRepository.findByChapter(
          'NIV', bible.bcode, firstCnum, firstVnum, lastCnum, lastVnum);

      final fileName = generatedFileName(bible.name, gaeVerses);

      await _bibleRepository.generatePpt(
        (optionFilter.selectBibleVersion == SelectBibleVersion.gae ||
                optionFilter.selectBibleVersion == SelectBibleVersion.both)
            ? gaeVerses
            : [],
        (optionFilter.selectBibleVersion == SelectBibleVersion.niv ||
                optionFilter.selectBibleVersion == SelectBibleVersion.both)
            ? nivVerses
            : [],
        fileName,
        optionFilter.hasVerseName,
      );

      return [...gaeVerses, ...nivVerses];
    });
  }

  Future<void> findByUserType(String customSearch) async {
    final replaceCustomSearch = customSearch.replaceAll(':', '장');
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final convertList = customSearch.trim().split(',');

      final List<Verse> gaeVerses = [];
      final List<Verse> nivVerses = [];

      final optionFilter = ref.read(optionFilterControllerProvider);

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

      await _bibleRepository.generatePpt(
          (optionFilter.selectBibleVersion == SelectBibleVersion.gae ||
                  optionFilter.selectBibleVersion == SelectBibleVersion.both)
              ? gaeVerses
              : [],
          (optionFilter.selectBibleVersion == SelectBibleVersion.niv ||
                  optionFilter.selectBibleVersion == SelectBibleVersion.both)
              ? nivVerses
              : [],
          '$replaceCustomSearch.pptx',
          optionFilter.hasVerseName);

      return [...gaeVerses, ...nivVerses];
    });
  }
}
