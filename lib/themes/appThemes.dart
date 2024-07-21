import 'package:flutter/material.dart';

class AppTheme{
  static final Color primaryColor=Color(0xFFB7935F);
  static ThemeData lightTheme= ThemeData(
    primaryColor: primaryColor,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Colors.black,

        )
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

  late ThemeData darkTheme;

}