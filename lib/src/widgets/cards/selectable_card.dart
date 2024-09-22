import 'package:flutter/material.dart';

import '../../theme/layout.dart';

/// A card that can be selected.
///
/// This card is a [Card] that can be selected. It is a wrapper around a [Card]
/// and a [GestureDetector] that calls the [onChanged] callback when tapped.
/// Customize for app specific needs.
/// Perfer customizing via [CardTheme] in [ThemeData].
class SelectableCard extends StatefulWidget {
  final Widget child;
  final ValueChanged<bool> onChanged;

  const SelectableCard({
    super.key,
    required this.onChanged,
    required this.child,
  });

  @override
  State<SelectableCard> createState() => _SelectableCardState();
}

class _SelectableCardState extends State<SelectableCard> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSelection,
      child: Card(
        child: Stack(
          children: [
            widget.child,
            if (_isSelected)
              const Positioned(
                top: 0,
                right: 0,
                child: Padding(
                  padding: smallEdgeInsets,
                  child: Icon(
                    Icons.check_circle,
                    // todo: Add opacity to the icon.
                  ),
                ),
              ),
          ],
        ),
      ),
    );
    // ),
    // );
  }

  void _toggleSelection() {
    setState(() {
      _isSelected = !_isSelected;
      widget.onChanged(_isSelected);
    });
  }
}
