import 'package:flutter/material.dart';

import 'models/constants.dart';

class SlitherWidget extends StatelessWidget {
  final double value;
  final double min;
  final double max;
  final Function onchanged;

  SlitherWidget({@required this.value,@required this.min,@required this.max,@required this.onchanged});

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      child: Slider(value: value,
          max: max,
          min: min,
          activeColor: cyan,
          inactiveColor: Colors.grey,
          onChanged: onchanged)
        , data: SliderTheme.of(context).copyWith(
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
        trackHeight: 5,
        inactiveTrackColor: Colors.cyan,
        overlayColor: navy_blue,
        activeTrackColor: cyan,
        thumbColor: navy_blue
    ),);
  }
}
