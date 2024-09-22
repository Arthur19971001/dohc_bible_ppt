import 'package:flutter/material.dart';

import 'field_label_wrapper.dart';

/// Provides an name text input field.
///
/// Customize for app specific needs.
class NameField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  const NameField({super.key, required this.labelText, this.hintText});

  @override
  Widget build(BuildContext context) {
    return FieldLabelWrapper(
      label: labelText,
      child: TextFormField(
        textInputAction: TextInputAction.next,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          hintText: hintText,
        ),
      ),
    );
  }
}
