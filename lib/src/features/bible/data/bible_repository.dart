import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

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

  Future<List<Verse>> findByChapter(int bcode, int cnum, int vnm) async {
    final results = await db.query(
      'verses',
      columns: ['vcode', 'bcode', 'cnum', 'vnum', 'content'],
      where: 'bcode = ? and cnum = ? and vnum <= ?',
      whereArgs: [bcode, cnum, vnm],
      orderBy: 'vnum asc',
    );

    try {
      final verses = results.map(Verse.fromMap).toList();
      return verses;
    } catch (e) {
      throw NotFoundException();
    }
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

  Future<List<Bible>> getBibles() async {
    final results = await db.query(
      'bibles',
      columns: ['vcode', 'bcode', 'type', 'name', 'chapter_count'],
      orderBy: 'bcode asc',
    );

    final bibles = results.map(Bible.fromMap).toList();

    return bibles;
  }
}
