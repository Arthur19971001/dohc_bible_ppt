import 'package:flutter/material.dart';

/// Provides a [Slider] with discrete values.
/// 
/// Customize for app specific needs.
/// Prefer customizing via [SliderThemeData] in [ThemeData].
/// May not need to be stateful if an onChanged is added and listened too.
class DiscreteSlider extends StatefulWidget {
  const DiscreteSlider({super.key});

  @override
  State<DiscreteSlider> createState() => DiscreteSliderState();
}

class DiscreteSliderState extends State<DiscreteSlider> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      max: 100,
      divisions: 10,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}
