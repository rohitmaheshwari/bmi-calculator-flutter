import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   appBarTheme: AppBarTheme(
      //     color: Color(0xFF0B1033),
      //   ),
      //   scaffoldBackgroundColor: Color(0xFF0B1033),
      //   accentColor: Colors.purple,
      //   textTheme: TextTheme(
      //     bodyText2: TextStyle(color: Colors.white),
      //   ),
      // ),
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          color: Color(0xFF0A0E21),
        ),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: InputPage(),
    );
  }
}
