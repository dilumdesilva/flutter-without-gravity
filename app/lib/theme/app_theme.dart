import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const darkNavy = Color(0xFF0A1628);
  static const electricBlue = Color(0xFF2979FF);

  static final TextTheme _textThemeDark = TextTheme(
    displayLarge: GoogleFonts.spaceGrotesk(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineLarge: GoogleFonts.spaceGrotesk(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    titleLarge: GoogleFonts.spaceGrotesk(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleMedium: GoogleFonts.spaceGrotesk(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyLarge: GoogleFonts.inter(fontSize: 16, color: Colors.white),
    bodyMedium: GoogleFonts.inter(fontSize: 14, color: Colors.white70),
    labelLarge: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    labelMedium: GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Colors.white54,
    ),
  );

  static final TextTheme _textThemeLight = TextTheme(
    displayLarge: GoogleFonts.spaceGrotesk(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: darkNavy,
    ),
    headlineLarge: GoogleFonts.spaceGrotesk(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: darkNavy,
    ),
    titleLarge: GoogleFonts.spaceGrotesk(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: darkNavy,
    ),
    titleMedium: GoogleFonts.spaceGrotesk(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: darkNavy,
    ),
    bodyLarge: GoogleFonts.inter(
      fontSize: 16,
      color: darkNavy.withValues(alpha: 0.8),
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: 14,
      color: darkNavy.withValues(alpha: 0.7),
    ),
    labelLarge: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: darkNavy,
    ),
    labelMedium: GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: darkNavy.withValues(alpha: 0.6),
    ),
  );

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme:
          ColorScheme.fromSeed(
            seedColor: electricBlue,
            brightness: Brightness.dark,
            surface: darkNavy,
            primary: electricBlue,
          ).copyWith(
            surfaceContainerLow: const Color(0xFF132238),
            surfaceContainerLowest: const Color(0xFF1C2E4A),
          ),
      textTheme: _textThemeDark,
      scaffoldBackgroundColor: darkNavy,
      appBarTheme: const AppBarTheme(
        backgroundColor: darkNavy,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: darkNavy,
      ),
      cardColor: const Color(0xFF1C2E4A),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF132238),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: electricBlue, width: 1),
        ),
        hintStyle: GoogleFonts.inter(color: Colors.white54),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
      dividerColor: Colors.white.withValues(alpha: 0.05),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme:
          ColorScheme.fromSeed(
            seedColor: electricBlue,
            brightness: Brightness.light,
            surface: const Color(0xFFF9F9FF),
            primary: electricBlue,
          ).copyWith(
            surfaceContainerLow: const Color(0xFFF0F3FF),
            surfaceContainerLowest: Colors.white,
          ),
      textTheme: _textThemeLight,
      scaffoldBackgroundColor: const Color(0xFFF9F9FF),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFF9F9FF),
        iconTheme: IconThemeData(color: darkNavy),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
      ),
      cardColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFF0F3FF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: electricBlue, width: 1),
        ),
        hintStyle: GoogleFonts.inter(color: darkNavy.withValues(alpha: 0.5)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
      dividerColor: darkNavy.withValues(alpha: 0.05),
    );
  }
}
