import 'package:flutter/material.dart';

import '../../theme/layout.dart';

/// An example of an SimpleDialog
///
/// Open the dialog with [AppSimpleDialog.open].
/// Customize and or copy for apps specific needs.
class AppSimpleDialog extends StatelessWidget {
  const AppSimpleDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimpleDialog(
      title: Text('Set backup account'),
      children: <Widget>[
        _DialogItem(
          icon: Icons.account_circle,
          text: 'username@gmail.com',
        ),
        _DialogItem(
          icon: Icons.account_circle,
          text: 'user02@gmail.com',
        ),
        _DialogItem(
          icon: Icons.add_circle,
          text: 'Add account',
        ),
      ],
    );
  }

  static Future<void> open(BuildContext context) async {
    await showDialog<void>(
        context: context,
        useRootNavigator: false,
        builder: (BuildContext context) => const AppSimpleDialog());
  }
}

class _DialogItem extends StatelessWidget {
  final IconData? icon;
  final String text;

  const _DialogItem({
    this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      onPressed: () => Navigator.of(context).pop(text),
      child: Row(
        children: [
          Icon(icon),
          Flexible(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: defaultSpace),
              child: Text(text),
            ),
          ),
        ],
      ),
    );
  }
}
