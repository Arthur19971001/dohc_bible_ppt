import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

part 'bible_db_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Database> bibleDbProvider(BibleDbProviderRef ref) async {
  sqfliteFfiInit();

  databaseFactory = databaseFactoryFfi;

  final databasePath = await databaseFactory.getDatabasesPath();
  final dbPath = join(databasePath, 'holybible.db');

  await _deleteOriginalDatabase(dbPath);
  await _generateDabaBaseFile(dbPath);

  return _openDatabase(dbPath);
}

Future<void> _deleteOriginalDatabase(String dbPath) async {
  final file = File(dbPath);

  if (file.existsSync()) {
    file.deleteSync();
  }
}

Future<void> _generateDabaBaseFile(String dbPath) async {
  try {
    Directory(dirname(dbPath)).createSync(recursive: true);
  } catch (_) {}

  final data = await rootBundle.load(url.join('assets', 'holybible.db'));
  final bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

  await File(dbPath).writeAsBytes(bytes, flush: true);
}

Future<Database> _openDatabase(String dbPath) async {
  if (Platform.isWindows) {
    return databaseFactory.openDatabase(
      dbPath,
      options: OpenDatabaseOptions(version: 2),
    );
  }

  return openDatabase(
    dbPath,
    version: 2,
  );
}
