import 'dart:math';

import 'package:flutter/cupertino.dart';

// enum BMIClassification { underweight, normal, overweight, obese }

class CalculatorBrain {
  final int height;
  final int weight;
  double _bmi;
  // BMIClassification _bmiClassification;

  CalculatorBrain({@required this.height, @required this.weight});

  String calculatedBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi < 18.5) {
      // _bmiClassification = BMIClassification.underweight;
      return "Underweight";
    } else if (_bmi >= 18.5 && _bmi < 25) {
      // _bmiClassification = BMIClassification.normal;
      return "Normal";
    } else if (_bmi >= 25 && _bmi < 30) {
      // _bmiClassification = BMIClassification.overweight;
      return "Overweight";
    }
    // } else if (_bmi >= 30) {
    // _bmiClassification = BMIClassification.obese;
    return "Obese";
    // }
  }

  String getInterpretation() {
    if (_bmi < 18.5) {
      return "You have a lower than normal body weight. Eat more!";
    } else if (_bmi >= 18.5 && _bmi < 25) {
      return "You have a normal body weight. Good job!";
    } else if (_bmi >= 25 && _bmi < 30) {
      return "You have a higher than normal body weight. Exercise more!";
    }
    // } else if (_bmi >= 30) {
    return "You have gained a lot of fats. Eat fruits, skip a meal at night and exercise!";
    // }
  }
}
