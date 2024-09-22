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
    final TextEditingController firstTextEditCtr =
        TextEditingController(text: '1');
    final TextEditingController lastTextEditCtr =
        TextEditingController(text: '${bible.chapterCount}');

    final verseController = ref.watch(verseControllerProvider.notifier);

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
                controller: firstTextEditCtr,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            defaultSeparator,
            const Text('To:'),
            SizedBox(
              width: 50,
              child: TextField(
                controller: lastTextEditCtr,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            defaultSeparator,
            ElevatedButton(
              onPressed: () async {
                await verseController.findByChapter(
                  bible.bcode,
                  int.parse(firstTextEditCtr.text),
                  int.parse(lastTextEditCtr.text),
                );
              },
              child: const Text('Generate'),
            ),
          ],
        ),
      ],
    );
  }
}
