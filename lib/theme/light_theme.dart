import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor:  Color(0xff212529),
  secondaryHeaderColor: Colors.white,
  colorScheme: ColorScheme.light(),
  floatingActionButtonTheme:FloatingActionButtonThemeData(
    backgroundColor: Colors.white,
  ),
  iconTheme: IconThemeData(
      color: Color(0xff212529),
  ),
);