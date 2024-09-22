import 'package:flutter/material.dart';

import '../text/label_text.dart';

/// Provides a [Checkbox] widget wrapped for this apps specific needs.
///
/// Customize and or copy for apps specific needs.
/// Perfer customizing via the [CheckboxTheme] in [ThemeData] where possible
/// May not need to be stateful if onChanged is listened too.
class AppCheckbox extends StatefulWidget {
  final String labelText;
  final bool initValue;
  final ValueChanged<bool>? onChanged;

  const AppCheckbox({
    super.key,
    required this.labelText,
    this.initValue = false,
    this.onChanged,
  });

  @override
  State<AppCheckbox> createState() => _AppCheckboxState();
}

class _AppCheckboxState extends State<AppCheckbox> {
  late bool _value;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        title: LabelText(widget.labelText),
        value: _value,
        onChanged: (value) {
          setState(() {
            _value = value ?? false;
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
