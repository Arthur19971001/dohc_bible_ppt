import 'package:flutter/material.dart';

/// Display text widget
/// 
/// Material's largest text style
class DisplayText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final int? maxLines;
  const DisplayText(
    this.text, {
    super.key,
    this.textAlign = TextAlign.left,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.displayLarge,
      textAlign: textAlign,
      overflow: (maxLines != null) ? TextOverflow.ellipsis : null,
      maxLines: maxLines,
    );
  }
}
