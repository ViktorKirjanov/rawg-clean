import 'package:flutter/material.dart';

class AppTheme {
  static const Color black = Color(0xFF111519);
  static const Color darkBlue = Color(0xFF202d3d);
  static const Color blue = Color(0xFF283345);
  static const Color white = Colors.white;
  static const Color red = Colors.redAccent;
  static const Color darkGrey = Color(0xFF1d2027);
  static const Color grey = Color(0XFF8B8B8B);
  static const Color green = Color(0XFF40ffaf);

  // Form elements
  static const inputRadius = BorderRadius.all(Radius.circular(16.0));

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
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.5),
      filled: true,
      fillColor: darkBlue,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: blue),
        borderRadius: inputRadius,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: blue),
        borderRadius: inputRadius,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: blue),
        borderRadius: inputRadius,
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: blue),
        borderRadius: inputRadius,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: red),
        borderRadius: inputRadius,
      ),
      errorStyle: TextStyle(
        color: red,
      ),
      errorMaxLines: 2,
      labelStyle: TextStyle(
        color: darkGrey,
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
      ),
      hintStyle: TextStyle(color: white),
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
