import 'dart:io';

import 'package:dart_pptx/dart_pptx.dart';
import 'package:open_document/open_document.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../../bible_db_provider.dart';
import '../domain/domain.dart';
import 'bible_api_exception.dart';

part 'bible_repository.g.dart';

@Riverpod(keepAlive: true)
BibleRepository bibleRepository(BibleRepositoryRef ref) {
  final db = ref.watch(bibleDbProviderProvider).requireValue;

  return BibleRepository(db);
}

class BibleRepository {
  final Database db;

  BibleRepository(this.db);

  Future<List<Verse>> findByChapter(String vcode, int bcode, int firstCnum,
      int firstVnum, int lastCnum, int lastVnum) async {
    late final List<Map<String, Object?>> results = [];

    for (var cnum = firstCnum; cnum <= lastCnum; cnum++) {
      final first = cnum == firstCnum ? firstVnum : 1;
      final last = cnum == lastCnum ? lastVnum : 999;

      final result = await db.query(
        'verses',
        columns: ['vcode', 'bcode', 'cnum', 'vnum', 'content'],
        where:
            'vcode = ? and bcode = ? and cnum = ? and vnum >= ? and vnum <= ?',
        whereArgs: [vcode, bcode, cnum, first, last],
        orderBy: 'vnum asc',
      );

      results.addAll(result);
    }

    try {
      final verses = results.map(Verse.fromMap).toList();
      return verses;
    } catch (e) {
      throw NotFoundException();
    }
  }

  Future<void> generatePpt(
      List<Verse> gaeVerses, List<Verse> nivVerses, Bible bible) async {
    final ppt = PowerPoint();

    for (var i = 0; i < gaeVerses.length; i++) {
      ppt.addTitleOnlySlide(
        title: '''
          ${gaeVerses[i].content}

          ${nivVerses[i].content}
        '''
            .toTextValue(),
      );
    }

    final bytes = await ppt.save();
    if (bytes != null) {
      if (Platform.isWindows) {
        final tempDirectory = await getTemporaryDirectory();
        final file = File(
            '${tempDirectory.path}/${bible.name}${gaeVerses.first.cnum}:${gaeVerses.first.vnum}-${gaeVerses.last.cnum}:${gaeVerses.last.vnum}.pptx');

        if (file.existsSync()) {
          file.deleteSync();
        }

        file.writeAsBytesSync(bytes);

        await OpenDocument.openDocument(filePath: file.path);
      } else {
        await Share.shareXFiles(
          [
            XFile.fromData(
              bytes,
              name: 'bible_generator.pptx',
              mimeType:
                  'application/vnd.openxmlformats-officedocument.presentationml.presentation',
              lastModified: DateTime.now(),
              length: bytes.length,
            ),
          ],
          text: 'Presentation',
        );
      }
    }
  }

  Future<List<Bible>> getBibles() async {
    final results = await db.query(
      'bibles',
      columns: ['vcode', 'bcode', 'type', 'name', 'chapter_count'],
      orderBy: 'bcode asc',
    );

    final bibles = results.map(Bible.fromMap).toList();

    return bibles;
  }

  Future<List<Bible>> searchBiblesByName(String name) async {
    final results = await db.query(
      'bibles',
      columns: ['vcode', 'bcode', 'type', 'name', 'chapter_count'],
      where: 'name like ?',
      whereArgs: ['%$name%'],
      orderBy: 'bcode asc',
    );

    final bibles = results.map(Bible.fromMap).toList();

    return bibles;
  }
}
