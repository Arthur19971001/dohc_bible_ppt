import 'package:flutter/material.dart';

/// Provides a wrapped [PopupMenuButton] for app specific needs.
///
/// Customize for app specific needs.
/// Prefer customizing via [PopupMenuTheme] in [ThemeData].
/// If no child or icon is provided the button defaults to horizontal ellipsis.
class AppPopupMenu extends StatelessWidget {
  final Set<String> items;
  final ValueChanged<String>? onSelected;
  final Icon? icon;
  final Widget? child;

  const AppPopupMenu({
    super.key,
    required this.items,
    this.onSelected,
    this.icon,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final builtItems = items
        .map((item) => PopupMenuItem<String>(
              value: item,
              child: Text(item),
            ))
        .toList();

    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      onSelected: (value) => onSelected?.call(value),
      itemBuilder: (_) => builtItems,
      icon: icon,
      child: child,
    );
  }
}
