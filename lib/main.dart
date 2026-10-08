import 'package:flutter/material.dart';

import 'constants.dart';
import 'screens/input_page.dart';

void main() {
  runApp(const BmiCalculatorApp());
}

class BmiCalculatorApp extends StatelessWidget {
  const BmiCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kBackgroundColor,
        appBarTheme: const AppBarTheme(backgroundColor: kBackgroundColor),
      ),
      home: const InputPage(),
    );
  }
}
