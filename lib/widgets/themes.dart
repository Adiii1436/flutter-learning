import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.lightBlue,
      cardColor: Colors.white,
      canvasColor: MyTheme.creamColor,
      accentColor: Colors.black,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.lightBlue,
      cardColor: Vx.black,
      canvasColor: Vx.gray900,
      accentColor: Colors.white,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
      ));

  //colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkgrey = Vx.gray100;
  static Color darkBulish = Color.fromARGB(255, 6, 6, 129);
}
