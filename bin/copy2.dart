import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as path;

void main() {
  final outputDir = Directory('./bin/template');
  final inputDir = Directory('./bin/ppt');

  if (!outputDir.existsSync()) {
    outputDir.createSync(recursive: true);
  } else {
    outputDir.deleteSync(recursive: true);
    outputDir.createSync(recursive: true);
  }

  final files = inputDir.listSync(recursive: true);
  for (final file in files) {
    if (file is File) {
      // outputFile.writeAsStringSync(file.readAsStringSync());
      final sb = StringBuffer();
      // sb.writeln('/// This file is generated, do not edit!');
      // sb.writeln('/// See `bin/copy.dart` for more information.');
      // sb.writeln();
      // sb.writeln('/// Path: ${file.path}');
      // Fix for encoding: UTF-16
      // sb.write('const List<int> template = [');
      //  // final bytes = content.buffer.asUint16List();
      // for (final byte in bytes) {
      //   sb.write(' $byte,');
      // }
      // sb.writeln('];');
      // sb.write("const String template = r'''");
      try {
        if (file.path.endsWith('.png') ||
            file.path.endsWith('.jpg') ||
            file.path.endsWith('.wdp') ||
            file.path.endsWith('.jpeg')) {
          // Base 64 string
          final bytes = file.readAsBytesSync();
          final base64 = base64Encode(bytes);
          sb.write(base64);
        } else {
          final content = file.readAsStringSync();
          sb.write(content.trim());
        }
      } catch (e) {
        // Handle encoding error
        print('Error reading file ${file.path}: $e');
        file.deleteSync();
        continue;
      }
      // sb.writeln("''';");
      sb.writeln();

      String relativePath = file.path.substring(inputDir.path.length);
      relativePath = relativePath.startsWith('/_rels') ||
              relativePath.endsWith('.png') ||
              relativePath.endsWith('.jpg') ||
              relativePath.endsWith('.wdp') ||
              relativePath.endsWith('.jpeg')
          ? relativePath
          : '$relativePath.mustache';

      // Check for . files
      final filename = path.basename(file.path);
      if (filename.startsWith('.')) {
        // Replace . with _
        relativePath = relativePath.replaceAll(filename, '_$filename');
      }
      final outputFile = File(outputDir.path + relativePath);
      outputFile.createSync(recursive: true);
      outputFile.writeAsStringSync(sb.toString().trim());
    }
  }
}
