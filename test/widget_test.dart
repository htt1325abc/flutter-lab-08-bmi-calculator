import 'package:flutter_test/flutter_test.dart';

import 'package:lab08_bmi_calculator/calculator_brain.dart';
import 'package:lab08_bmi_calculator/main.dart';

void main() {
  test('tính BMI và phân loại Normal', () {
    final calculator = CalculatorBrain(height: 170, weight: 60);
    expect(calculator.calculateBMI(), '20.8');
    expect(calculator.getResult(), 'Normal');
  });

  testWidgets('hiển thị đầy đủ màn hình nhập', (tester) async {
    await tester.pumpWidget(const BmiCalculatorApp());

    expect(find.text('MALE'), findsOneWidget);
    expect(find.text('FEMALE'), findsOneWidget);
    expect(find.text('CALCULATE'), findsOneWidget);
  });
}
