import 'package:flutter/material.dart';

import '../text/label_text.dart';

/// Provides a [Slider] with a label.
///
/// Customize for app specific needs.
/// Prefer customizing via [SliderThemeData] in [ThemeData].
/// May not need to be stateful if an onChanged is added and listened too.
class AppSlider extends StatefulWidget {
  const AppSlider({super.key});

  @override
  AppSliderState createState() => AppSliderState();
}

class AppSliderState extends State<AppSlider> {
  double _currentSliderValue = 10;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        LabelText('Value: ${_currentSliderValue.round()}'),
        Slider(
          value: _currentSliderValue,
          max: 100,
          label: _currentSliderValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value;
            });
          },
        ),
      ],
    );
  }
}
