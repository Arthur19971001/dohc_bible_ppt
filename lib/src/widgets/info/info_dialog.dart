import 'package:flutter/material.dart';

import '../../theme/layout.dart';
import '../text/body_text.dart';

/// Provides an dialog for providing information.
class InfoDialog extends StatelessWidget {
  final String title;
  final List<String> messages;

  const InfoDialog({super.key, required this.title, required this.messages});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(title),
      contentPadding: smallEdgeInsets,
      children: [
        for (final message in messages) BodyText(message),
      ],
    );
  }

  static Future<void> show(
      BuildContext context, String title, List<String> messages) async {
    await showDialog<void>(
      context: context,
      useRootNavigator: false,
      builder: (BuildContext context) {
        return InfoDialog(
          title: title,
          messages: messages,
        );
      },
    );
  }
}
