import 'package:flutter/material.dart';

import '../text/label_text.dart';

/// Provides a stateful tristate checkbox widget with an onChanged callback.
///
/// Customize the widget for the apps specific needs.
class TristateCheckbox extends StatefulWidget {
  final String labelText;
  final bool? initValue;
  final ValueChanged<bool?>? onChanged;

  const TristateCheckbox({
    super.key,
    required this.labelText,
    this.initValue = false,
    this.onChanged,
  });

  @override
  State<TristateCheckbox> createState() => _TristateCheckboxState();
}

class _TristateCheckboxState extends State<TristateCheckbox> {
  late bool? _value;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        title: LabelText(widget.labelText),
        tristate: true,
        value: _value,
        onChanged: (value) {
          setState(() {
            _value = value;
            widget.onChanged?.call(_value);
          });
        });
  }

  @override
  void initState() {
    super.initState();
    _value = widget.initValue;
  }
}
