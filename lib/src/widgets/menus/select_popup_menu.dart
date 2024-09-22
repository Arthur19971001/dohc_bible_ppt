import 'package:flutter/material.dart';

/// Provides a [PopupMenuButton] that indicates selected items.
///
/// Customize for app specific needs.
/// Prefer customizing via [PopupMenuTheme] in [ThemeData].
/// If no child or icon is provided the button defaults to horizontal ellipsis.
class SelectPopupMenu extends StatefulWidget {
  final Set<String> items;
  final ValueChanged<Set<String>>? onSelected;
  final Icon? icon;
  final Widget? child;

  const SelectPopupMenu({
    super.key,
    required this.items,
    this.onSelected,
    this.icon,
    this.child,
  });

  @override
  State<SelectPopupMenu> createState() => _SelectPopupMenuState();
}

class _SelectPopupMenuState extends State<SelectPopupMenu> {
  final Set<String> _checkedValues = {};

  @override
  Widget build(BuildContext context) {
    final builtItems = widget.items
        .map((item) => CheckedPopupMenuItem<String>(
              value: item,
              checked: _checkedValues.contains(item),
              child: Text(item),
            ))
        .toList();

    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      onSelected: _onSelected,
      itemBuilder: (_) => builtItems,
      icon: widget.icon,
      child: widget.child,
    );
  }

  void _onSelected(String value) {
    setState(() {
      if (_checkedValues.contains(value)) {
        _checkedValues.remove(value);
      } else {
        _checkedValues.add(value);
      }
    });
    widget.onSelected?.call(_checkedValues);
  }
}
