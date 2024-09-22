import 'package:flutter/material.dart';

import '../theme/layout.dart';
import 'text/headline_text.dart';

/// Provides a styled bottom sheet.
///
/// Customize for app specific needs.
class AppBottomSheet extends StatelessWidget {
  final String titleText;
  final Widget content;
  const AppBottomSheet(
      {super.key, required this.titleText, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.horizontal_rule_rounded,
          size: 48,
        ),
        HeadlineText(titleText, textAlign: TextAlign.center),
        smallSeperator,
        const Divider(),
        smallSeperator,
        content,
        defaultSeparator,
      ],
    );
  }

  static Future<void> show({
    required BuildContext context,
    required String titleText,
    required Widget content,
  }) async {
    await showModalBottomSheet<void>(
      useSafeArea: true,
      context: context,
      // scrollControlDisabledMaxHeightRatio: 0.6,
      builder: (context) {
        return AppBottomSheet(
          titleText: titleText,
          content: content,
        );
      },
    );
  }
}
