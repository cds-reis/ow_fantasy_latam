import 'package:flutter/material.dart';

ThemeData buildTheme() {
  return ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(primary: Colors.cyan),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
        ),
        textStyle: WidgetStatePropertyAll(
          TextStyle(fontSize: 16),
        ),
      ),
    ),
    listTileTheme: const ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
  );
}
