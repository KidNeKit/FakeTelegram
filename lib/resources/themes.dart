import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  textTheme: textTheme,
);

TextTheme textTheme = TextTheme(labelSmall: _labelSmall);

TextStyle _labelSmall = const TextStyle(
  fontSize: 10,
  fontFamily: 'SF Pro',
);
