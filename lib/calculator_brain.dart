import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;
  double _bmi = 0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    }
    if (_bmi >= 18.5) {
      return 'Normal';
    }
    return 'Underweight';
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Chỉ số BMI cao hơn mức bình thường. Hãy duy trì vận động hợp lý.';
    }
    if (_bmi >= 18.5) {
      return 'Chỉ số BMI của bạn nằm trong mức bình thường. Hãy tiếp tục duy trì!';
    }
    return 'Chỉ số BMI thấp hơn mức bình thường. Hãy chú ý chế độ dinh dưỡng.';
  }
}
