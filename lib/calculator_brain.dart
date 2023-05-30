import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});
  final int height;
  final int weight;
  double _bmi = 0.0;
  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String topText() {
    if (_bmi >= 25.0)
      return 'overweight';
    else if (_bmi > 18.5)
      return 'normal';
    else
      return 'underweight';
  }

  String bottomText() {
    if (_bmi >= 25.0) {
      return 'Need to work out , my friend';
    } else if (_bmi > 18.5)
      return 'chill out dear. you are going good';
    else
      return 'grab some food, my friend.';
  }
}
