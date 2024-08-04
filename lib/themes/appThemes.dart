import 'package:flutter/material.dart';

class AppTheme{
  static final Color primaryColor=Color(0xFFB7935F);
  static final Color primaryDarkColor=Color(0xFF141A2E);
  static final Color secondaryDarkColor=Color(0xFFFACC1D);



  static ThemeData lightTheme= ThemeData(
    primaryColor: primaryColor,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        color: Colors.black,
          fontFamily: 'messiri'
      ),
      titleMedium: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontFamily: 'messiri'
      ),
      bodyLarge: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: Colors.black,
          fontFamily: 'messiri'
      ),
      bodyMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Colors.black,
          fontFamily: 'messiri'
      ),
    ),
    cardColor: Colors.white,
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
      selectedIconTheme: IconThemeData(
        color: Colors.black,
        size: 45,
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.white,
        size: 40,
      )
    )
  );

  static ThemeData darkTheme=ThemeData(
      primaryColor: primaryDarkColor,
      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontFamily: 'messiri'
        ),
        titleMedium: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontFamily: 'messiri'
        ),
        bodyLarge: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w400,
            color: Colors.white,
            fontFamily: 'messiri'
        ),
        bodyMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white,
            fontFamily: 'messiri'
        ),
      ),
      cardColor: primaryDarkColor,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: secondaryDarkColor,
          selectedIconTheme: IconThemeData(
            color: secondaryDarkColor,
            size: 45,
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.white,
            size: 40,
          )
      )
  );



}