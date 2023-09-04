import 'package:flutter/material.dart';

class AppTheme {
  static const Color black = Color(0xFF111519);
  static const Color white = Colors.white;
  static const Color red = Colors.redAccent;
  static const Color darkGrey = Color(0xFF1d2027);
  static const Color grey = Color(0XFF8B8B8B);

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: black,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      color: black,
      centerTitle: true,
      iconTheme: IconThemeData(color: grey),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 24,
      ),
    ),
  );
}
