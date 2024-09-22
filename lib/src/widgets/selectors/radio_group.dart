import 'package:flutter/material.dart';

import '../text/label_text.dart';

/// Provides a stateful RadioGroup widget with an onChanged callback.
///
/// Customize the widget for the apps specific needs.
class RadioGroup extends StatefulWidget {
  final String labelText;
  final List<String> options;
  final ValueChanged<String>? onChanged;

  const RadioGroup({
    super.key,
    required this.labelText,
    required this.options,
    this.onChanged,
  });

  @override
  State<RadioGroup> createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  String _selected = '';

  @override
  Widget build(BuildContext context) {
    final radios = widget.options
        .map((e) => RadioListTile(
              title: LabelText(e),
              value: e,
              groupValue: _selected,
              onChanged: (value) {
                setState(() {
                  _selected = value ?? '';
                  widget.onChanged?.call(value!);
                });
              },
            ))
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [LabelText(widget.labelText), ...radios],
    );
  }
}
