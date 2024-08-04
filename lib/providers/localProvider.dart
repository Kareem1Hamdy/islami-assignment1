import 'package:flutter/material.dart';

class LocalProvider extends ChangeNotifier{
  String currentLanguage='en';

  changeLanguage(String lang){
    currentLanguage=lang;
    notifyListeners();
  }

}