import 'package:flutter/material.dart';

import 'info_dialog.dart';

/// Provides an overlay info IconButton in the top right
/// 
/// On tap it displays a message. 
class InfoOverlay extends StatelessWidget {
  final Widget child;
  final String title;
  final List<String> messages;

  const InfoOverlay({
    super.key,
    required this.child,
    required this.title,
    required this.messages,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          top: 0.0,
          right: 0.0,
          child: IconButton(
              onPressed: () async => InfoDialog.show(context, title, messages),
              icon: const Icon(Icons.info_outlined)),
        ),
      ],
    );
  }
}
