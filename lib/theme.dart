import 'package:flutter/material.dart';

class Round6Theme {
  static const int _round6PrimaryValue = 0xFFFF1D87;
  static const int _round6Backgound = 0xFF121212;

  static const MaterialColor color = MaterialColor(
    _round6PrimaryValue,
    <int, Color>{
      50: Color(0xFFFCE4EC),
      100: Color(0xFFF8BBD0),
      200: Color(0xFFF48FB1),
      300: Color(0xFFF06292),
      400: Color(0xFFEC407A),
      500: Color(_round6PrimaryValue),
      600: Color(0xFFD81B60),
      700: Color(0xFFC2185B),
      800: Color(0xFFAD1457),
      900: Color(0xFF880E4F),
    },
  );

  static ButtonStyle outlineButtonStyle({
    Color colorButtonDefault = Colors.white,
    double padding = 24,
  }) {
    return OutlinedButton.styleFrom(
      foregroundColor: color,
      padding: EdgeInsets.symmetric(
        vertical: padding,
      ),
      side: const BorderSide(
        color: color,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
