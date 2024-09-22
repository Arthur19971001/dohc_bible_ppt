import 'package:flutter/material.dart';

import '../theme/layout.dart';

/// Widget class to display an error message on app startup
class AppStartupErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const AppStartupErrorWidget(
      {super.key, required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, style: Theme.of(context).textTheme.headlineSmall),
            defaultSeparator,
            ElevatedButton(
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
