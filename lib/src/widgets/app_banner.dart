import 'package:flutter/material.dart';

import '../theme/layout.dart';
import 'snack_bars.dart';

/// Provides an app specific [MaterialBanner].
///
/// Customize for app specific needs.
class AppBanner extends StatelessWidget {
  final VoidCallback? onDismissed;
  const AppBanner({super.key, this.onDismissed});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      ///need to add ClipRRect to MaterialBanner for radius
      borderRadius: defaultBorderRadius,
      child: MaterialBanner(
        ///there is no any shap property in MaterialBanner
        backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
        content: const Text('Example Banner'),
        leading: const Icon(Icons.warning_amber),
        actions: [
          TextButton(
            onPressed: () {
              onDismissed?.call();
              SnackBars.of(context).showInfo('Signed In');
            },
            child: const Text('Sign In'),
          ),
          TextButton(
            onPressed: () {
              onDismissed?.call();
              SnackBars.of(context).showInfo('Dismissed');
            },
            child: const Text('Dismiss'),
          ),
        ],
      ),
    );
  }
}
