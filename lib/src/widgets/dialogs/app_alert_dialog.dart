import 'package:flutter/material.dart';

/// App AlertDialog
///
/// Open the dialog with [AppAlertDialog.open].
/// Customize and or copy for apps specific needs.
class AppAlertDialog extends StatelessWidget {
  const AppAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Allow location services'),
      content: const Text('Let us help determine location. This means '
          'sending anonymous location data to us'),
      actions: <Widget>[
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel')),
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Allow')),
      ],
    );
  }

  static Future<void> open(BuildContext context) async {
    await showDialog<void>(
        context: context,
        useRootNavigator: false,
        builder: (BuildContext context) => const AppAlertDialog());
  }
}
