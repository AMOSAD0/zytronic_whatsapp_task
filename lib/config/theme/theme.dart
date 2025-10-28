import 'package:flutter/material.dart';

class AppTheme {
  // Light Theme Colors
  static const Color primaryLight = Color(0xFF075E54); // WhatsApp Green
  static const Color primaryLightVariant = Color(0xFF128C7E);
  static const Color secondaryLight = Color(0xFF25D366); // Light Green
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color surfaceLight = Color(0xFFF7F8FA);
  static const Color chatBackgroundLight = Color(0xFFECE5DD);
  static const Color incomingBubbleLight = Color(0xFFFFFFFF);
  static const Color outgoingBubbleLight = Color(0xFFDCF8C6);
  static const Color textPrimaryLight = Color(0xFF000000);
  static const Color textSecondaryLight = Color(0xFF667781);
  static const Color dividerLight = Color(0xFFE9EDEF);
  static const Color iconLight = Color(0xFF54656F);
  static const Color onlineIndicatorLight = Color(0xFF25D366);

  // Dark Theme Colors
  static const Color primaryDark = Color(0xFF00A884);
  static const Color primaryDarkVariant = Color(0xFF008069);
  static const Color secondaryDark = Color(0xFF25D366);
  static const Color backgroundDark = Color(0xFF0B141A);
  static const Color surfaceDark = Color(0xFF1F2C33);
  static const Color chatBackgroundDark = Color(0xFF0B141A);
  static const Color incomingBubbleDark = Color(0xFF1F2C33);
  static const Color outgoingBubbleDark = Color(0xFF005C4B);
  static const Color textPrimaryDark = Color(0xFFE9EDEF);
  static const Color textSecondaryDark = Color(0xFF8696A0);
  static const Color dividerDark = Color(0xFF2A3942);
  static const Color iconDark = Color(0xFF8696A0);
  static const Color onlineIndicatorDark = Color(0xFF25D366);

  // Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: primaryLight,
    scaffoldBackgroundColor: backgroundLight,
    colorScheme: const ColorScheme.light(
      primary: primaryLight,
      secondary: secondaryLight,
      surface: surfaceLight,
      background: backgroundLight,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: textPrimaryLight,
      onBackground: textPrimaryLight,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryLight,
      foregroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: backgroundLight,
      selectedItemColor: primaryLight,
      unselectedItemColor: iconLight,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: secondaryLight,
      foregroundColor: Colors.white,
    ),
    cardTheme: CardThemeData(
      color: surfaceLight,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    dividerTheme: const DividerThemeData(color: dividerLight, thickness: 1),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surfaceLight,
    ),
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: primaryDark,
    scaffoldBackgroundColor: backgroundDark,
    colorScheme: const ColorScheme.dark(
      primary: primaryDark,
      secondary: secondaryDark,
      surface: surfaceDark,
      background: backgroundDark,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: textPrimaryDark,
      onBackground: textPrimaryDark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: surfaceDark,
      foregroundColor: textPrimaryDark,
      elevation: 0,
      iconTheme: IconThemeData(color: textPrimaryDark),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: backgroundDark,
      selectedItemColor: secondaryDark,
      unselectedItemColor: iconDark,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: secondaryDark,
      foregroundColor: Colors.white,
    ),
    cardTheme: CardThemeData(
      color: surfaceDark,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    dividerTheme: const DividerThemeData(color: dividerDark, thickness: 1),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surfaceDark,
    ),
  );
}
