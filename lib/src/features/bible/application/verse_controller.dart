import 'dart:io';

import 'package:dart_pptx/dart_pptx.dart';
import 'package:flutter/material.dart';
import 'package:open_document/open_document.dart';
import 'package:path_provider/path_provider.dart';
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
    final pres = PowerPoint();

    pres.addTitleSlide(
      title: TextValue.uniform('Bible'),
    );

    final bytes = await pres.save();
    if (bytes != null) {
      final tempDir = await getTemporaryDirectory();

      File('${tempDir.path}/hello.pptx').writeAsBytesSync(bytes);
      final file = File('${tempDir.path}/hello.pptx');
      // await OpenFile.open(file.path);
      debugPrint(file.path);
      await OpenDocument.openDocument(filePath: file.path);
    }
    // await OpenFile.open(pres);
  }
}
