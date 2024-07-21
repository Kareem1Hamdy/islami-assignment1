import 'package:flutter/material.dart';
import 'package:islami/components/defaultScaffold.dart';
import 'package:islami/themes/appThemes.dart';
import 'package:islami/ui/hadeeth/hedeeth%20screen.dart';
import 'package:islami/ui/quraan/quraan%20screen.dart';
import 'package:islami/ui/radio/radio%20screen.dart';
import 'package:islami/ui/sebha/sebha%20screen.dart';

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
  ];

  @override
  Widget build(BuildContext context) {
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
            label: 'Quraan',
            backgroundColor: AppTheme.primaryColor,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/hadeeth.png')),
            label: 'Hadeeth',
            backgroundColor: AppTheme.primaryColor,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/sebha_blue.png')),
            label: 'Tasbeeh',
            backgroundColor: AppTheme.primaryColor,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/radio_blue.png')),
            label: 'Radio',
            backgroundColor: AppTheme.primaryColor,
          ),
        ],
      ),
      body: listScreen[currentIndex],
    );
  }
}
