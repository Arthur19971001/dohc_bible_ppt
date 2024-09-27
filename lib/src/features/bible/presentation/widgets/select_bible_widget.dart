import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../theme/layout.dart';
import '../../application/verse_controller.dart';
import '../../domain/domain.dart';

class SelectBibleWidget extends ConsumerWidget {
  final Bible bible;
  const SelectBibleWidget(this.bible, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController firstVerseTextEditCtr = TextEditingController(
      text: '1',
    );
    final TextEditingController lastVerseTextEditCtr = TextEditingController(
      text: '${bible.chapterCount}',
    );
    final TextEditingController firstChapterTextEditCtr =
        TextEditingController(text: '1');
    final TextEditingController lastChapterTextEditCtr =
        TextEditingController(text: '1');

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(bible.name),
        Row(
          children: [
            const Text('From:'),
            SizedBox(
              width: 50,
              child: TextField(
                controller: firstVerseTextEditCtr,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Text('장'),
            SizedBox(
              width: 50,
              child: TextField(
                controller: firstChapterTextEditCtr,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Text('절'),
            defaultSeparator,
            const Text('To:'),
            SizedBox(
              width: 50,
              child: TextField(
                controller: lastVerseTextEditCtr,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Text('장'),
            SizedBox(
              width: 50,
              child: TextField(
                controller: lastChapterTextEditCtr,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Text('절'),
            defaultSeparator,
            ElevatedButton(
              onPressed: () async {
                await ref.read(verseControllerProvider.notifier).findByChapter(
                      bible,
                      int.parse(firstVerseTextEditCtr.text),
                      int.parse(firstChapterTextEditCtr.text),
                      int.parse(lastVerseTextEditCtr.text),
                      int.parse(lastChapterTextEditCtr.text),
                    );
              },
              child: const Text('생성하기'),
            ),
          ],
        ),
      ],
    );
  }
}
