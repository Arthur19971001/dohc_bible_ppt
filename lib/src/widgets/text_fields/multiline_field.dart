import 'package:flutter/material.dart';

import 'field_label_wrapper.dart';

/// Provides a multiline text input field.
///
/// Customize for app specific needs.
class MultilineField extends StatelessWidget {
  final String? helperText;
  final String? hintText;
  final String labelText;
  final int maxLines;

  const MultilineField({
    super.key,
    this.helperText,
    this.hintText,
    required this.labelText,
    this.maxLines = 3,
  });

  @override
  Widget build(BuildContext context) {
    return FieldLabelWrapper(
      label: labelText,
      child: TextFormField(
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintText: hintText,
          helperText: helperText,
        ),
        maxLines: maxLines,
      ),
    );
  }
}
