import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../theme/layout.dart';
import '../../application/verse_controller.dart';

class CustomVerseSearchWidget extends ConsumerWidget {
  const CustomVerseSearchWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController searchCtr = TextEditingController();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextField(
            controller: searchCtr,
            decoration: const InputDecoration(
              hintText: 'ex) 창세기 2:1, 창세기 1:1-2, 창세기 3:1-4:2',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        defaultSeparator,
        ElevatedButton(
          onPressed: () async {
            await ref
                .read(verseControllerProvider.notifier)
                .findByUserType(searchCtr.text);
          },
          child: const Text('생성하기'),
        ),
      ],
    );
  }
}
