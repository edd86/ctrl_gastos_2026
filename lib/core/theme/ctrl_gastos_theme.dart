import 'package:flutter/material.dart';

class CtrlGastosTheme {
  static const Color _primaryLight = Color(0xFF85BB65);
  static const Color _primaryDark = Color(0xFF5A8F42);
  static const Color _primaryContainerLight = Color(0xFFB8D9A0);
  static const Color _primaryContainerDark = Color(0xFF3D6B2A);

  static const Color _secondaryLight = Color(0xFF4A90D9);
  static const Color _secondaryDark = Color(0xFF2C6AA8);
  static const Color _secondaryContainerLight = Color(0xFF9DC4F0);
  static const Color _secondaryContainerDark = Color(0xFF1D4D7A);

  static const Color _surfaceLight = Color(0xFFF5F5F5);
  static const Color _surfaceDark = Color(0xFF1E1E1E);
  static const Color _onSurfaceLight = Color(0xFF1C1B1F);
  static const Color _onSurfaceDark = Color(0xFFE6E1E5);

  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          primary: _primaryLight,
          onPrimary: Colors.white,
          primaryContainer: _primaryContainerLight,
          secondary: _secondaryLight,
          secondaryContainer: _secondaryContainerLight,
          surface: _surfaceLight,
          onSurface: _onSurfaceLight,
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.dark(
          primary: _primaryDark,
          onPrimary: Colors.white,
          primaryContainer: _primaryContainerDark,
          secondary: _secondaryDark,
          secondaryContainer: _secondaryContainerDark,
          surface: _surfaceDark,
          onSurface: _onSurfaceDark,
        ),
      );
}
