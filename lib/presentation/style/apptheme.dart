import 'package:blueferns_taskaju/presentation/style/styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData buildAppTheme() {
    return ThemeData(
        fontFamily: fontFamily,
        useMaterial3: false,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,

        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return primaryColor;
              }
              return white;
            },
          ),
          checkColor: WidgetStateProperty.all(Colors.white),
          side: const BorderSide(color: Color(0xFF7B1F44)),
        ),

        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontFamily: fontFamily,
            fontVariations: fontVariations,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.grey;
              }
              return const Color(0xFF7B1F44);
            },
          ),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          elevation: WidgetStateProperty.all(4.0),
          textStyle: WidgetStateProperty.all(
            const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              fontFamily: fontFamily,
              fontVariations: fontVariations500,
            ),
          ),
        )));
  }
}