import 'package:flutter/material.dart';

/// Widget class to display a loading indicator during app startup
class AppStartupLoadingWidget extends StatelessWidget {
  const AppStartupLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Column(
          children: [
            Text('Loading...'),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
