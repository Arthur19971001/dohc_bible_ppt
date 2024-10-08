import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../../theme/layout.dart';
import '../../application/option_filter_controller.dart';
import '../../domain/domain.dart';

class OptionDrawerWidget extends ConsumerWidget {
  const OptionDrawerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterOptions = ref.watch(optionFilterControllerProvider);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Padding(
        padding: defaultEdgeInsets,
        child: NavigationDrawer(
          selectedIndex: null,
          children: [
            ListTile(
              dense: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('생성 종류선택'),
                  ToggleSwitch(
                    initialLabelIndex: filterOptions.selectBibleVersion.value,
                    totalSwitches: 3,
                    labels:
                        SelectBibleVersion.values.map((e) => e.label).toList(),
                    onToggle: (index) {
                      ref
                          .read(optionFilterControllerProvider.notifier)
                          .changeSelectedBible(index!);
                    },
                  ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              dense: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('구문생성여부'),
                  ToggleSwitch(
                    initialLabelIndex: filterOptions.hasVerseName ? 0 : 1,
                    totalSwitches: 2,
                    labels: const ['YES', 'NO'],
                    onToggle: (index) {
                      ref
                          .read(optionFilterControllerProvider.notifier)
                          .changedHasVerseName(index!);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
