import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'widgetbook_app.dart';

/// Provides a toggle between the app and the [Widgetbook].
class WidgetbookToggle extends StatefulWidget {
  final Widget child;
  const WidgetbookToggle({super.key, required this.child});

  @override
  State<WidgetbookToggle> createState() => _WidgetbookToggleState();
}

class _WidgetbookToggleState extends State<WidgetbookToggle> {
  bool _isToggledOn = false;

  @override
  Widget build(BuildContext context) {
    if (kReleaseMode) return widget.child;

    return GestureDetector(
      onLongPress: () {
        setState(() {
          _isToggledOn = !_isToggledOn;
        });
      },
      child: _isToggledOn ? const WidgetbookApp() : widget.child,
    );
  }
}
