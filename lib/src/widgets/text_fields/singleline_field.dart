import 'package:flutter/material.dart';

import 'field_label_wrapper.dart';

/// Provides an single line text input field.
///
/// Customize for app specific needs.
class SinglelineField extends StatelessWidget {
  final String? helperText;
  final String? hintText;
  final String labelText;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;

  const SinglelineField({
    super.key,
    this.helperText,
    this.hintText,
    required this.labelText,
    this.onFieldSubmitted,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FieldLabelWrapper(
      label: labelText,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          helperText: helperText,
        ),
        onChanged: (value) => onChanged?.call(value),
        onFieldSubmitted: (value) => onFieldSubmitted?.call(value),
      ),
    );
  }
}
