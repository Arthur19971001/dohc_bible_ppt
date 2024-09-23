import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../navigation/presentation/main_scaffold.dart';
import '../../../../theme/layout.dart';
import '../../application/gae_bibles_controller.dart';
import '../presentation.dart';

class BibleScreen extends ConsumerWidget {
  const BibleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bibles = ref.watch(gaeBiblesContorllerProvider);

    return MainScaffold(
      title: 'Bible',
      body: Padding(
        padding: defaultEdgeInsets,
        child: Column(
          children: [
            const SearchBarWidget(),
            defaultSeparator,
            bibles.when(
              data: (bible) {
                return Expanded(
                  child: ListView.separated(
                    itemBuilder: (_, i) => SelectBibleWidget(bible[i]),
                    separatorBuilder: (_, __) => const Divider(),
                    itemCount: bible.length,
                  ),
                );
              },
              error: (_, __) => const Center(child: Text('Error')),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}
