import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/app.dart';
import 'src/widgetbook/widgetbook_toggle.dart';

void main() async {
  runApp(
    const ProviderScope(
      child: WidgetbookToggle(
        child: App(),
      ),
    ),
  );
}
