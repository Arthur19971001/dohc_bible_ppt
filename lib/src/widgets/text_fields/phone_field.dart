import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'field_label_wrapper.dart';

/// Provides an Phone text input field.
///
/// Customize for app specific needs.
class PhoneField extends StatelessWidget {
  const PhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    return FieldLabelWrapper(
      label: 'Phone Number',
      child: TextFormField(
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          hintText: 'Where can we reach you',
          counterText: '', // Force removing induced by maxLength
        ),
        keyboardType: TextInputType.phone,
        maxLength: 14,
        maxLengthEnforcement: MaxLengthEnforcement.none,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}
