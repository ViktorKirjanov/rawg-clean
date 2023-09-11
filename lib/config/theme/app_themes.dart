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
    colorScheme: ColorScheme.fromSeed(
      primary: Colors.white,
      seedColor: Colors.white,
      brightness: Brightness.dark,
    ),
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

  // Gradients

  static const linearGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 57, 52, 96),
      Color(0xFF1e2028),
    ],
    begin: FractionalOffset.centerLeft,
    end: FractionalOffset.centerRight,
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp,
  );
}
