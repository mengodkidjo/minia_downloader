import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.montserrat(
        fontSize: 23.0,
        fontWeight: FontWeight.bold,
        color: Colors.deepPurple,
      ),
      titleMedium: GoogleFonts.montserrat(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleSmall: GoogleFonts.montserrat(
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodySmall: GoogleFonts.montserrat(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: Colors.grey[600],
      ),
      labelSmall: GoogleFonts.montserrat(
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      labelMedium: GoogleFonts.montserrat(
        fontSize: 13.0,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
              color: Color.fromRGBO(240, 240, 240, 0.8), width: 2.0)),
      hintStyle: GoogleFonts.montserrat(
        fontSize: 13.0,
        fontWeight: FontWeight.normal,
        color: Colors.grey[400],
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            padding: const MaterialStatePropertyAll(EdgeInsets.all(24.0)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0))),
            textStyle: MaterialStatePropertyAll(
                GoogleFonts.montserrat(fontWeight: FontWeight.w500)))),
    cardColor: Colors.white,
  );
  static ThemeData dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurpleAccent, background: Colors.purple[900]),
    useMaterial3: true,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.montserrat(
        fontSize: 23.0,
        fontWeight: FontWeight.bold,
        color: Colors.deepPurple,
      ),
      titleMedium: GoogleFonts.montserrat(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: Colors.grey[400],
      ),
      titleSmall: GoogleFonts.montserrat(
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodySmall: GoogleFonts.montserrat(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: Colors.grey[400],
      ),
      labelSmall: GoogleFonts.montserrat(
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      labelMedium: GoogleFonts.montserrat(
        fontSize: 13.0,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
              color: Color.fromRGBO(255, 255, 255, 0.8), width: 2.0)),
      hintStyle: GoogleFonts.montserrat(
        fontSize: 13.0,
        fontWeight: FontWeight.normal,
        color: Colors.grey[600],
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            padding: const MaterialStatePropertyAll(EdgeInsets.all(24.0)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0))),
            textStyle: MaterialStatePropertyAll(
                GoogleFonts.montserrat(fontWeight: FontWeight.w500)))),
    cardColor: Colors.black38,
  );
}
