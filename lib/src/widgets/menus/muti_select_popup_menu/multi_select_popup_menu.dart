import 'package:flutter/material.dart';

import 'popup_menu_item_with_tap_blocked.dart';

/// Provides a wrapped [PopupMenuButton] for multi-select needs.
///
/// Customize for app specific needs.
/// Prefer customizing via [PopupMenuTheme] in [ThemeData].
class MultiSelectPopupMenu extends StatefulWidget {
  final Set<String> items;
  final ValueChanged<Set<String>>? onSelected;
  final Icon? icon;
  final Widget? child;

  const MultiSelectPopupMenu({
    super.key,
    required this.items,
    this.onSelected,
    this.icon,
    this.child,
  });

  @override
  State<MultiSelectPopupMenu> createState() => _MultiSelectPopupMenuState();
}

class _MultiSelectPopupMenuState extends State<MultiSelectPopupMenu> {
  final Set<String> _checkedValues = {};

  @override
  Widget build(BuildContext context) {
    // Warning: It would be better to encapsulate this as a separate widget.
    final buildItems = widget.items
        .map((item) => PopupMenuItemWithTapBlocked<String>(
              child: StatefulBuilder(
                builder: (_, StateSetter setState) {
                  return ListTile(
                    onTap: () => _onItemTap(item, setState),
                    leading:
                        Icon(_checkedValues.contains(item) ? Icons.done : null),
                    title: Text(item),
                  );
                },
              ),
            ))
        .toList();

    return PopupMenuButton(
      padding: EdgeInsets.zero,
      onCanceled: () => widget.onSelected?.call(_checkedValues),
      itemBuilder: (_) => buildItems,
      icon: widget.icon,
      child: widget.child,
    );
  }

  void _onItemTap(String item, StateSetter setState) {
    setState(() {
      if (_checkedValues.contains(item)) {
        _checkedValues.remove(item);
      } else {
        _checkedValues.add(item);
      }
    });
    widget.onSelected?.call(_checkedValues);
  }
}
