import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../navigation/data/app_route.dart';

// This is example screen to be used in the bottom navigation
class Tab1Screen extends StatelessWidget {
  const Tab1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Tab 1 screen'),
          OutlinedButton(
              onPressed: () => context.goNamed(AppRoute.child.name),
              child: const Text('Go to Child Screen')),
        ],
      ),
    );
  }
}
