import 'package:flutter/material.dart';

import 'field_label_wrapper.dart';

/// Provides an Money input field.
///
/// Customize for app specific needs.
class MoneyField extends StatelessWidget {
  final String labelText;

  const MoneyField({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return FieldLabelWrapper(
      label: labelText,
      child: TextFormField(
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          suffixText: 'NZD',
        ),
      ),
    );
  }
}
