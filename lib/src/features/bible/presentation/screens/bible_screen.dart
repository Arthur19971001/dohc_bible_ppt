import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../navigation/presentation/main_scaffold.dart';
import '../../../../theme/layout.dart';
import '../../application/gae_bibles_controller.dart';
import '../../application/verse_controller.dart';
import '../presentation.dart';
import '../widgets/custom_verse_search_widget.dart';
import '../widgets/option_drawer_widget.dart';

class BibleScreen extends ConsumerWidget {
  const BibleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bibles = ref.watch(gaeBiblesContorllerProvider);

    ref.listen(verseControllerProvider, (p, n) {
      n.when(
        data: (verses) {
          if (verses.isEmpty) return;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('PPT generated. Check your download folder.'),
            ),
          );
        },
        error: (o, s) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error $s'),
            ),
          );
        },
        loading: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Generating...'),
            ),
          );
        },
      );
    });

    return MainScaffold(
      title: 'Bible',
      drawer: const OptionDrawerWidget(),
      body: Padding(
        padding: defaultEdgeInsets,
        child: Column(
          children: [
            const CustomVerseSearchWidget(),
            defaultSeparator,
            divider(),
            defaultSeparator,
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

  Widget divider() => const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Divider(
              indent: 20.0,
              endIndent: 10.0,
              thickness: 1,
            ),
          ),
          Text(
            'OR',
            style: TextStyle(color: Colors.blueGrey),
          ),
          Expanded(
            child: Divider(
              indent: 10.0,
              endIndent: 20.0,
              thickness: 1,
            ),
          ),
        ],
      );
}
