import 'package:flutter/material.dart';

ThemeData buildTheme() {
  return ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(primary: Colors.cyan),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
    ),
    listTileTheme: const ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
  );
}
