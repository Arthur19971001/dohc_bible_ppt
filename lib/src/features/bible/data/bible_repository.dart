import 'package:dart_pptx/dart_pptx.dart';
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

  Future<List<Verse>> findByChapter(
      String vcode, int bcode, int cnum, int vnm) async {
    final results = await db.query(
      'verses',
      columns: ['vcode', 'bcode', 'cnum', 'vnum', 'content'],
      where: 'vcode = ? and bcode = ? and cnum = ? and vnum <= ?',
      whereArgs: [vcode, bcode, cnum, vnm],
      orderBy: 'vnum asc',
    );

    try {
      final verses = results.map(Verse.fromMap).toList();
      return verses;
    } catch (e) {
      throw NotFoundException();
    }
  }

  Future<void> generatePpt(List<Verse> gaeVerses, List<Verse> nivVerses) async {
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
