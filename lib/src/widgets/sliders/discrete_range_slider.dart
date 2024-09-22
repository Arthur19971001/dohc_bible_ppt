import 'package:flutter/material.dart';

/// A [RangeSlider] with discrete values.
/// 
/// Customize for app specific needs.
/// Prefer customizing via [SliderThemeData] in [ThemeData].
/// May not need to be stateful if an onChanged is added and listened too.
class DiscreteRangeSlider extends StatefulWidget {
  const DiscreteRangeSlider({super.key});

  @override
  State<DiscreteRangeSlider> createState() => DiscreteRangeSliderState();
}

class DiscreteRangeSliderState extends State<DiscreteRangeSlider> {
  RangeValues _currentRangeValues = const RangeValues(40, 80);

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: _currentRangeValues,
      max: 100,
      divisions: 5,
      labels: RangeLabels(
        _currentRangeValues.start.round().toString(),
        _currentRangeValues.end.round().toString(),
      ),
      onChanged: (RangeValues values) {
        setState(() {
          _currentRangeValues = values;
        });
      },
    );
  }
}
