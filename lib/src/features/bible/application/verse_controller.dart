import 'package:flutter/material.dart';
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

  Future<void> findByChapter(int bcode, int cnum, int vnm) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final verses = await _bibleRepository.findByChapter(bcode, cnum, vnm);

      debugPrint('verses: ${verses.length}');
      return verses;
    });
  }
}
