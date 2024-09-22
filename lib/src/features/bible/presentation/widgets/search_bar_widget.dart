import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../theme/layout.dart';
import '../../application/gae_bibles_controller.dart';

class SearchBarWidget extends ConsumerWidget {
  const SearchBarWidget({super.key});

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
              hintText: 'Search',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        defaultSeparator,
        ElevatedButton(
          onPressed: () async {
            await ref
                .read(gaeBiblesContorllerProvider.notifier)
                .searchBiblesByName(searchCtr.text);
          },
          child: const Text('Search'),
        ),
      ],
    );
  }
}
