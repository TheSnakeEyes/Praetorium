import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData buildTheme() {
  var t = ThemeData.dark();
  return t.copyWith(
    brightness: Brightness.dark,
    textTheme: TextTheme(
      headline1: GoogleFonts.lato(fontSize: 100, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      headline2: GoogleFonts.lato(fontSize: 62, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      headline3: GoogleFonts.lato(fontSize: 50, fontWeight: FontWeight.w400),
      headline4: GoogleFonts.lato(fontSize: 35, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      headline5: GoogleFonts.lato(fontSize: 25, fontWeight: FontWeight.w400),
      headline6: GoogleFonts.lato(fontSize: 21, fontWeight: FontWeight.w500, letterSpacing: 0.15),
      subtitle1: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      subtitle2: GoogleFonts.lato(fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyText1: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyText2: GoogleFonts.lato(fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      button: GoogleFonts.lato(fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 1.25),
      caption: GoogleFonts.lato(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
      overline: GoogleFonts.lato(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
    ),
  );
}
