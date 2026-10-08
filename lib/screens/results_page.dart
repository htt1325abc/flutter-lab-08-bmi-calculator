import 'package:flutter/material.dart';

import '../components/bottom_button.dart';
import '../components/reusable_card.dart';
import '../constants.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({
    super.key,
    required this.bmiResult,
    required this.resultText,
    required this.interpretation,
  });

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI CALCULATOR')),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Your Result',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: kActiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: const TextStyle(
                        color: Color(0xFF24D876),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      bmiResult,
                      style: const TextStyle(
                        fontSize: 82,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20, height: 1.4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              buttonTitle: 'RE-CALCULATE',
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
