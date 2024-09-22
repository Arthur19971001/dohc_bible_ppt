import 'package:flutter/material.dart';

import 'field_label_wrapper.dart';

/// Provides a password text input field.
///
/// Customize for app specific needs.
class PasswordField extends StatefulWidget {
  // final Key fieldKey;
  final String? labelText;
  const PasswordField({
    super.key,
    this.labelText = 'Password',
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isTextObscured = true;

  @override
  Widget build(BuildContext context) {
    return FieldLabelWrapper(
      label: widget.labelText!,
      child: TextFormField(
        obscureText: _isTextObscured,
        maxLength: 16,
        decoration: InputDecoration(
          filled: true,
          counterText: '', // Hide the counter text ".../16"
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _isTextObscured = !_isTextObscured;
              });
            },
            hoverColor: Colors.transparent,
            icon: Icon(
              _isTextObscured ? Icons.visibility : Icons.visibility_off,
              semanticLabel:
                  _isTextObscured ? 'Show password' : 'Hide password',
            ),
          ),
        ),
      ),
    );
  }
}
