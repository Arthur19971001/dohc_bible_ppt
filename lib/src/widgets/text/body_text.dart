import 'package:flutter/material.dart';

/// Body text widget
///
/// Material's smallest text style
class BodyText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final int? maxLines;
  const BodyText(
    this.text, {
    super.key,
    this.textAlign = TextAlign.left,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge,
      textAlign: textAlign,
      overflow: (maxLines != null) ? TextOverflow.ellipsis : null,
      maxLines: maxLines,
    );
  }
}
