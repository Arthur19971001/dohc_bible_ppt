import 'package:flutter/material.dart';
import '../option.dart';

/// Provides a multi-select toggle buttons with an onChanged callback.
/// 
/// This widget is a wrapper around a [ToggleButtons] widget
/// that provides a multi select toggle buttons.
/// Customize for app specific needs.
/// Depending on your use case, it may not need to be stateful.
class SingleSelectToggleButtons<T> extends StatefulWidget {
  final List<Option<T>> options;
  final Option<T> initialValue;
  final ValueChanged<Option<T>> onChanged;

  const SingleSelectToggleButtons({
    super.key,
    required this.initialValue,
    required this.onChanged,
    required this.options,
  });

  @override
  State<SingleSelectToggleButtons<T>> createState() =>
      _SingleSelectToggleButtonsState();
}

class _SingleSelectToggleButtonsState<T> extends State<SingleSelectToggleButtons<T>> {
  late Option<T> _selectedOption;

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      onPressed: (index) {
        setState(() {
          _selectedOption = widget.options[index];
          widget.onChanged(_selectedOption);
        });
      },
      isSelected:
          widget.options.map((e) => e.value == _selectedOption.value).toList(),
      children: widget.options.map((e) => e.widget).toList(),
    );
  }

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.initialValue;
  }
}
