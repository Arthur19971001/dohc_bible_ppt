import 'package:flutter/material.dart';

/// Provides a [DatePickerDialog] in a dialog on press.
///
/// Customize for app specific needs.
class DatePicker extends StatelessWidget {
  final String labelText;

  const DatePicker({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async => _openDialog(context), child: Text(labelText));
  }

  Future<void> _openDialog(BuildContext context) async {
    await showDialog<void>(
      context: context,
      useRootNavigator: false,
      builder: (BuildContext context) => DatePickerDialog(
        initialDate: DateTime.now(),
        firstDate: DateTime(1930),
        lastDate: DateTime(2050),
      ),
    );
  }
}
