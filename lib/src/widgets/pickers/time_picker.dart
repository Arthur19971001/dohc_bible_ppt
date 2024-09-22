import 'package:flutter/material.dart';

/// Provides a [TimePickerDialog] on press.
/// 
/// Customize for app specific needs.
class TimePicker extends StatelessWidget {
  final String labelText;

  const TimePicker({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async => _openDialog(context), child: Text(labelText));
  }

  Future<void> _openDialog(BuildContext context) async {
    await showDialog<void>(
      context: context,
      useRootNavigator: false,
      builder: (BuildContext context) => TimePickerDialog(
        initialTime: TimeOfDay.now(),
      ),
    );
  }
}
