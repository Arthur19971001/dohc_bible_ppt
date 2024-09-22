import 'package:flutter/material.dart';

/// A card that can be tapped.
/// 
/// This card is a [Card] that can be tapped. It is a wrapper around a [Card]
/// and an [InkWell] that calls the [onTap] callback when tapped.
/// Customize for app specific needs.
/// Perfer customizing via [CardTheme] in [ThemeData].
class TappableCard extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;

  const TappableCard({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
