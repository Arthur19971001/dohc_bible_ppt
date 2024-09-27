import 'dart:io';

import 'package:dart_pptx/dart_pptx.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../../bible_db_provider.dart';
import '../contents.dart';
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
      List<Verse> gaeVerses, List<Verse> nivVerses, String fileName) async {
    final ppt = PowerPoint();

    for (var i = 0; i < gaeVerses.length; i++) {
      ppt.addTitleOnlySlide(
        title: bibleContent(gaeVerses[i], nivVerses[i]).toTextValue(),
      );
    }

    final bytes = await ppt.save();
    if (bytes != null) {
      final downloadDirectory = await getDownloadsDirectory();

      final filePath = join(
        downloadDirectory!.path,
        fileName,
      );

      final file = File(filePath);

      if (file.existsSync()) {
        await file.delete();
      }

      file.writeAsBytesSync(bytes);
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
