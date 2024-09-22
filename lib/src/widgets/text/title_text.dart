import 'package:flutter/material.dart';

/// Title text widget
/// 
/// Material's 3rd largest text style
class TitleText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final int? maxLines;
  const TitleText(
    this.text, {
    super.key,
    this.textAlign = TextAlign.left,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge,
      textAlign: textAlign,
      overflow: (maxLines != null) ? TextOverflow.ellipsis : null,
      maxLines: maxLines,
    );
  }
}
