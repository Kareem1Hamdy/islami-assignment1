import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode currentMode=ThemeMode.light;

  changeTheme(ThemeMode themeMode){
    currentMode=themeMode;
    notifyListeners();
  }

}