import 'package:flutter/material.dart';

extension ThemeModeExtention on ThemeMode {
  static final names = {
    ThemeMode.system: 'system',
    ThemeMode.light: 'light',
    ThemeMode.dark: 'dark',
  };

  String? get modeName => names[this];
}

var themeModeFromString = (String? modeName) {
  switch (modeName) {
    case 'system':
      return ThemeMode.system;
    case 'light':
      return ThemeMode.light;
    case 'dark':
      return ThemeMode.dark;
    default:
      return ThemeMode.system;
  }
};