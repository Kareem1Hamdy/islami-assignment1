import 'package:flutter/material.dart';
import 'package:islami/themes/appThemes.dart';
import 'package:islami/ui/home/home_screen.dart';
import 'package:islami/ui/quraan/suraDetails.dart';
import 'package:islami/ui/splash/splash_screen.dart';

void main() async{


  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: AppTheme.lightTheme,
    );
  }
}
