import 'package:flutter/material.dart';

import '../../navigation/presentation/main_scaffold.dart';

class ChildScreen extends StatelessWidget {
  const ChildScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainScaffold(
      title: 'Child',
      body: Center(
        child: Text('Child Screen'),
      ),
    );
  }
}
