import 'package:flutter/material.dart';

/// Provides a [DateRangePickerDialog] on press.
///
/// Customize for app specific needs.
class DateRangePicker extends StatelessWidget {
  final String labelText;

  const DateRangePicker({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async => _openDialog(context), child: Text(labelText));
  }

  Future<void> _openDialog(BuildContext context) async {
    await showDialog<void>(
      context: context,
      useRootNavigator: false,
      builder: (BuildContext context) => DateRangePickerDialog(
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5),
      ),
    );
  }
}
