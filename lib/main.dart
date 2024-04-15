import 'package:bmi_calculator/dmi/beginingpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyDmiF(),
      theme: _buildThemeData(context),
    );
  }

  ThemeData _buildThemeData(context) {
    Brightness platformBrightness = MediaQuery.of(context).platformBrightness;

    // Default to light theme if unable to detect system theme
    Brightness userPreferredBrightness = platformBrightness ?? Brightness.light;

    return ThemeData(
      brightness: userPreferredBrightness,
      // Define other theme properties here
    );
  }
}
