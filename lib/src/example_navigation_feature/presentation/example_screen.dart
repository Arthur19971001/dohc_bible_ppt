import 'package:flutter/material.dart';

import '../../navigation/presentation/main_scaffold.dart';

// This is example screen to be used in the drawer
class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainScaffold(
      title: 'Example',
      body: Center(
        child: Text('Example Screen'),
      ),
    );
  }
}
