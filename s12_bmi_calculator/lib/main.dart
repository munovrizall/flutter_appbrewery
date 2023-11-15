import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'screens/result_page.dart';
import 'constants.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      theme: ThemeData(
        sliderTheme: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.white,
          inactiveTrackColor: const Color(0xFF8D8E98),
          thumbColor: kPrimaryColor,
          overlayColor: Color(0x1fEB1555),
          thumbShape: const RoundSliderThumbShape(
            enabledThumbRadius: 14,
          ),
          overlayShape: const RoundSliderOverlayShape(
              overlayRadius: 20
          ),
        ),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        colorScheme: ColorScheme.dark().copyWith(
          primary: Color(0xFF0A0E21),
        ),
      ),
    );
  }
}

