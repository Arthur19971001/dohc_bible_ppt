import 'package:flutter/material.dart';

/// A label text widget.
/// 
/// Material's 2nd smallest text style.
class LabelText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final int? maxLines;
  const LabelText(
    this.text, {
    super.key,
    this.textAlign = TextAlign.left,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelLarge,
      textAlign: textAlign,
      overflow: (maxLines != null) ? TextOverflow.ellipsis : null,
      maxLines: maxLines,
    );
  }
}
