import 'package:flutter/material.dart';
import 'package:islami/components/defaultScaffold.dart';
import 'package:islami/components/functions.dart';
import 'package:islami/providers/themeProvider.dart';
import 'package:islami/themes/appThemes.dart';
import 'package:islami/ui/hadeeth/hedeeth%20screen.dart';
import 'package:islami/ui/quraan/quraan%20screen.dart';
import 'package:islami/ui/radio/radio%20screen.dart';
import 'package:islami/ui/sebha/sebha%20screen.dart';
import 'package:islami/ui/setting/settings_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex=0;

  List<Widget> listScreen=[
    QuraanScreen(),
    HadeethScreen(),
    SebhaScreen(),
    RadioScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {

    ThemeProvider themeProvider=Provider.of<ThemeProvider>(context);
    return DefaultScaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex=index;
          });

        },
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/quraan_blue.png')),
            label: getLocal(context)!.quraanTab,
            backgroundColor: themeProvider.currentMode==ThemeMode.dark?
            AppTheme.primaryDarkColor:AppTheme.primaryColor,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/hadeeth.png')),
            label: getLocal(context)!.hadeethTab,
            backgroundColor: themeProvider.currentMode==ThemeMode.dark?
            AppTheme.primaryDarkColor:AppTheme.primaryColor,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/sebha_blue.png')),
            label: getLocal(context)!.tasbeehTab,
            backgroundColor: themeProvider.currentMode==ThemeMode.dark?
            AppTheme.primaryDarkColor:AppTheme.primaryColor,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/radio_blue.png')),
            label: getLocal(context)!.radioTab,
            backgroundColor: themeProvider.currentMode==ThemeMode.dark?
            AppTheme.primaryDarkColor:AppTheme.primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: getLocal(context)!.settings,
            backgroundColor: themeProvider.currentMode==ThemeMode.dark?
            AppTheme.primaryDarkColor:AppTheme.primaryColor,
          ),
        ],
      ),
      body: listScreen[currentIndex],
      context: context,
    );
  }
}
