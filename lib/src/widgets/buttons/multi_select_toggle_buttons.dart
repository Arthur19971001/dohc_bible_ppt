import 'package:flutter/material.dart';

import 'toggle_item.dart';

/// Provides multi-select toggle buttons with an onChanged callback.
///
/// Customize for app specific needs.
/// Depending on your use case, it may not need to be stateful.
class MultiSelectToggleButtons extends StatefulWidget {
  final List<ToggleItem> initialValue;
  final ValueChanged<List<ToggleItem>> onChanged;

  const MultiSelectToggleButtons({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<MultiSelectToggleButtons> createState() =>
      _MultiSelectToggleButtonsState();
}

class _MultiSelectToggleButtonsState extends State<MultiSelectToggleButtons> {
  final List<ToggleItem> _items = [];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      onPressed: (index) {
        // replace the item at the index with a new item that has
        // the same child, but isSelected is toggled.
        setState(() {
          _items[index] = ToggleItem(
            _items[index].child,
            !_items[index].isSelected,
          );
          widget.onChanged(_items);
        });
      },
      isSelected: _items.map((e) => e.isSelected).toList(),
      children: widget.initialValue.map((e) => e.child).toList(),
    );
  }

  @override
  void initState() {
    super.initState();
    _items.addAll(widget.initialValue);
  }
}
