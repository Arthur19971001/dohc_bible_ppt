import 'package:flutter/material.dart';

import '../text/label_text.dart';

/// Provides a [Switch] widget wrapped for this apps specific needs.
///
/// Customize and or copy for apps specific needs.
/// Perfer customizing via the [SwitchTheme] in [ThemeData] where possible
/// May not need to be stateful if onChanged is listened too.
class AppSwitch extends StatefulWidget {
  final String labelText;
  final bool initValue;
  final ValueChanged<bool>? onChanged;

  const AppSwitch({
    super.key,
    this.initValue = false,
    this.onChanged,
    required this.labelText,
  });

  @override
  State<AppSwitch> createState() => _AppSwitchState();
}

class _AppSwitchState extends State<AppSwitch> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
          value: _value,
          onChanged: (value) {
            setState(() {
              _value = value;
              widget.onChanged?.call(_value);
            });
          },
        ),
        SwitchListTile(
          title: LabelText(widget.labelText),
          value: _value,
          onChanged: (value) {
            setState(() {
              _value = value;
              widget.onChanged?.call(_value);
            });
          },
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _value = widget.initValue;
  }
}
