import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../theme/layout.dart';
import '../extensions/iterable_widget_x.dart';
import '../text/label_text.dart';

/// Provides a Label wrapper for input fields.
/// 
/// If orientation is landscape the label is to the left of the field.
/// If orientation is portait the label is above the field.
class FieldLabelWrapper extends StatelessWidget {
  final Widget child;
  final String label;

  const FieldLabelWrapper({
    super.key,
    required this.child,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return orientation == Orientation.landscape
        ? Row(
            children: [
              if (label.isNotEmpty) LabelText(label),
              Expanded(child: child),
            ].toSeparatedList(defaultSeparator),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (label.isNotEmpty) LabelText(label),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: child,
              ),
            ],
          );
  }
}
