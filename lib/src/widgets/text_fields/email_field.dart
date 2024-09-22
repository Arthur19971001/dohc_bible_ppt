import 'package:flutter/material.dart';

import 'field_label_wrapper.dart';

/// Provides an Email text input field.
/// 
/// Customize for app specific needs.
class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return FieldLabelWrapper(
      label: 'Email',
      child: TextFormField(
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          hintText: 'Your email address',
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}
