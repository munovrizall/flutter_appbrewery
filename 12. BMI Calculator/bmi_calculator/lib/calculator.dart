import 'dart:math';

class Calculator {

  Calculator({required this.height, required this.weight});

  final int height;
  final int weight;

  double _bmi = 0;

  String calculateBmi() {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getBmi() {
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getComment() {
    if (_bmi >= 25) {
      return 'You have a higher than normal weight, try to exercise more!';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight, good job!';
    } else {
      return 'You have a lower than a normal body weight, you can eat a bit more';
    }
  }
}