import 'package:flutter/material.dart';

/// A headline text widget.
/// 
/// Material's 2nd largest text style.
class HeadlineText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final int? maxLines;
  const HeadlineText(
    this.text, {
    super.key,
    this.textAlign = TextAlign.left,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineLarge,
      textAlign: textAlign,
      overflow: (maxLines != null) ? TextOverflow.ellipsis : null,
      maxLines: maxLines,
    );
  }
}
