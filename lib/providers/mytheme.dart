import 'package:flutter/material.dart';

class MyTheme {
  static Color primarycolor = Color(0xffB7935F);
  static Color primarydarkcolor = Color(0xff141A2E);
  static Color yellowcolor = Color(0xffFACC1D);

  // Light mode theme
  static ThemeData lightmode = ThemeData(
    primaryColor: primarycolor,
    canvasColor: primarycolor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: true,
      selectedItemColor: Colors.black,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 30,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 25,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 25,
      ),
    ),
  );


  static ThemeData darkmode = ThemeData(
    primaryColor: primarydarkcolor,
    canvasColor: primarydarkcolor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: true,
      selectedItemColor: yellowcolor,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 30,
      ),
      titleMedium: TextStyle(
        color: Colors.white,

        fontWeight: FontWeight.w600,
        fontSize: 25,
      ),
      bodyLarge: TextStyle(
        color: Colors.white,

        fontWeight: FontWeight.w400,
        fontSize: 25,
      ),
    ),
  );

}