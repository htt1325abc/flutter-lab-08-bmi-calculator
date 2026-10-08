import 'package:flutter/material.dart';

import '../calculator_brain.dart';
import '../components/bottom_button.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../components/round_icon_button.dart';
import '../constants.dart';
import 'results_page.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 170;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI CALCULATOR')),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      color: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      onTap: () => setState(() => selectedGender = Gender.male),
                      child: const IconContent(icon: Icons.male, label: 'MALE'),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      onTap: () =>
                          setState(() => selectedGender = Gender.female),
                      child: const IconContent(
                        icon: Icons.female,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: kActiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('HEIGHT', style: kLabelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text('$height', style: kNumberTextStyle),
                        const Text(' cm', style: kLabelTextStyle),
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      activeColor: kAccentColor,
                      onChanged: (value) =>
                          setState(() => height = value.round()),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: _numberCard('WEIGHT', weight, true)),
                  Expanded(child: _numberCard('AGE', age, false)),
                ],
              ),
            ),
            BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                final calculator = CalculatorBrain(
                  height: height,
                  weight: weight,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => ResultsPage(
                      bmiResult: calculator.calculateBMI(),
                      resultText: calculator.getResult(),
                      interpretation: calculator.getInterpretation(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _numberCard(String label, int value, bool isWeight) {
    return ReusableCard(
      color: kActiveCardColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: kLabelTextStyle),
          Text('$value', style: kNumberTextStyle),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundIconButton(
                icon: Icons.remove,
                tooltip: 'Giảm $label',
                onPressed: () => setState(() {
                  if (isWeight && weight > 1) weight--;
                  if (!isWeight && age > 1) age--;
                }),
              ),
              const SizedBox(width: 10),
              RoundIconButton(
                icon: Icons.add,
                tooltip: 'Tăng $label',
                onPressed: () => setState(() {
                  if (isWeight) {
                    weight++;
                  } else {
                    age++;
                  }
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
