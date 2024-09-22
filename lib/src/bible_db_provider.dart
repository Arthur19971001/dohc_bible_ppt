import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'bible_db_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Database> bibleDbProvider(BibleDbProviderRef ref) async {
  final databasePath = await getDatabasesPath();
  final dbPath = join(databasePath, 'holybible.db');

  final exists = await databaseExists(dbPath);

  if (!exists) {
    try {
      await Directory(dirname(dbPath)).create(recursive: true);
    } catch (_) {}

    final data = await rootBundle.load(url.join('assets', 'holybible.db'));
    final bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    await File(dbPath).writeAsBytes(bytes, flush: true);
  }

  return openDatabase(
    dbPath,
    version: 1,
  );
}
