import 'package:flutter/material.dart';
import 'package:islami/providers/localProvider.dart';
import 'package:islami/providers/themeProvider.dart';
import 'package:islami/themes/appThemes.dart';
import 'package:islami/ui/home/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


void main() async{


  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_)=> ThemeProvider(),
      ),
      ChangeNotifierProvider(
        create: (_)=> LocalProvider(),
      ),
    ],
      child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    ThemeProvider themeProvider=Provider.of<ThemeProvider>(context);
    LocalProvider localProvider=Provider.of<LocalProvider>(context);


    return MaterialApp(
      debugShowCheckedModeBanner: false,

      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(localProvider.currentLanguage),

      home: HomeScreen(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.currentMode,
    );
  }
}
