import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Round6Theme {
  static const MaterialColor colorPrimary = MaterialColor(
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
  static const int _round6PrimaryValue = 0xFFFF1D87;

  static const Color _round6Backgound = Color(0xFF121212);

  static ButtonStyle outlineButtonStyle({
    Color colorButton = Colors.white,
    double padding = 24,
  }) {
    return OutlinedButton.styleFrom(
      padding: EdgeInsets.symmetric(
        vertical: padding,
      ),
      side: BorderSide(
        color: colorButton,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }

  static ThemeData themeData = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: _round6Backgound,
    primarySwatch: colorPrimary,
    primaryColor: colorPrimary,
    textTheme: GoogleFonts.wendyOneTextTheme(
      ThemeData.dark().textTheme,
    ),
    appBarTheme: ThemeData.dark().appBarTheme.copyWith(
          elevation: 0,
          backgroundColor: Colors.transparent,
          titleTextStyle: GoogleFonts.wendyOne(fontSize: 25),
          centerTitle: true,
        ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: outlineButtonStyle(),
    ),
  );
}
