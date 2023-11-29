import 'package:flutter/material.dart';

class MyColorScheme {
  static Color primaryColor = const Color(0xFF3498DB);
  static Color secondaryColor = const Color(0xFFF39C12);
  static Color backgroundColor = const Color(0xFFF5F5F5);
  static Color textColor = const Color(0xFF333333);
  static Color white = const Color(0xFFFFFFFF);
  static Color green = const Color(0xFF32CD32);
  static Color red = const Color(0xFFFF3B30);
  static Color lightGray = const Color(0xFFA0A0A0);
  static Color selectedIconBackground = const Color(0xFFF5F5F5);
  static Color splashColor = Colors.transparent;
  static Color highlightColor = Colors.transparent;
  static Color hoverColor = Colors.transparent;

  static Color clapColor = MyColorScheme.primaryColor;
}

final ColorScheme colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: MyColorScheme.primaryColor,
  onPrimary: MyColorScheme.white,
  secondary: MyColorScheme.secondaryColor,
  onSecondary: MyColorScheme.white,
  error: MyColorScheme.red,
  onError: MyColorScheme.white,
  background: MyColorScheme.lightGray,
  onBackground: MyColorScheme.white,
  surface: MyColorScheme.white,
  onSurface: MyColorScheme.textColor,
);

final ThemeData themeData =
    ThemeData(hintColor: MyColorScheme.lightGray, colorScheme: colorScheme);

final TextStyle regularTextStyle =
    TextStyle(color: MyColorScheme.textColor, fontSize: 18);

final TextStyle boldTextStyle = TextStyle(
    color: MyColorScheme.textColor, fontSize: 18, fontWeight: FontWeight.bold);

final TextStyle hintTextStyle =
    TextStyle(color: MyColorScheme.lightGray, fontSize: 16);
