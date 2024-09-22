import 'package:flutter/material.dart';

/// Provides a Text widget fitted width available
class FittedText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  const FittedText(this.text, {super.key, this.textAlign = TextAlign.left});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        text,
        textAlign: textAlign,
      ),
    );
  }
}
