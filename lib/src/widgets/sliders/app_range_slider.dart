import 'package:flutter/material.dart';

import '../text/label_text.dart';

/// Provides a Range Slider.
/// 
/// Customize for app specific needs.
/// Prefer customizing via [SliderThemeData] in [ThemeData].
/// May not need to be stateful if an onChanged is added and listened too.
class AppRangeSlider extends StatefulWidget {
  const AppRangeSlider({super.key});

  @override
  AppRangeSliderState createState() => AppRangeSliderState();
}

class AppRangeSliderState extends State<AppRangeSlider> {
  RangeValues _currentValues = const RangeValues(10, 20);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LabelText(
            'Range: ${_currentValues.start.round()} - ${_currentValues.end.round()}'),
        RangeSlider(
          values: _currentValues,
          max: 100,
          onChanged: (values) {
            setState(() {
              _currentValues = values;
            });
          },
        ),
      ],
    );
  }
}
