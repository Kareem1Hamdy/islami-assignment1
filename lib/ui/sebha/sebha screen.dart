import 'package:flutter/material.dart';
import 'package:islami/components/functions.dart';
import 'package:islami/providers/themeProvider.dart';
import 'package:islami/themes/appThemes.dart';
import 'package:provider/provider.dart';

class SebhaScreen extends StatefulWidget {
   SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {


  int count=0;
  int index=0;
  List<String> listTasbeeh=[
    'سبحان الله',
    'الحمد لله',
    'لا إله إلا الله',
    'الله أكبر'
  ];

  double turns=0.0;

  @override
  Widget build(BuildContext context) {

    ThemeProvider themeProvider=Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                setState(() {

                  turns=turns+1/10;
                  if(count<33){
                    count++;
                  }else{
                    count=0;
                    if(index<listTasbeeh.length-1){
                      index++;
                    }else{
                      index=0;
                    }
                  }
                });
              },
              child: AnimatedRotation(
                duration: const Duration(milliseconds: 200),
                turns: turns,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    themeProvider.currentMode==ThemeMode.dark?
                    Image.asset(
                        'assets/images/head_sebha_dark.png',
                      height: 105,
                      width: 73,
                    ):
                    Image.asset(
                      'assets/images/head_sebha_logo.png',
                      height: 105,
                      width: 73,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 75),
                      child: themeProvider.currentMode==ThemeMode.dark?
                      Image.asset(
                        'assets/images/body_sebha_dark.png',
                        height: 234,
                        width: 232,
                      ):
                      Image.asset(
                        'assets/images/body_sebha_logo.png',
                        height: 234,
                        width: 232,
                      ),
                    ),
                  ],
                ),
              ),
            ),
             Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Text(
                  getLocal(context)!.numOfPraises,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Container(
              width: 69,
              height: 81,
              decoration: BoxDecoration(
                color: themeProvider.currentMode==ThemeMode.dark?
                AppTheme.primaryDarkColor:AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(25)
              ),
              child:  Center(child: Text(
                  '$count',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400
                ),
              )
              ),
            ),
            const SizedBox(height: 30,),
            Container(
              width: 137,
              decoration: BoxDecoration(
                color: themeProvider.currentMode==ThemeMode.dark?
                AppTheme.secondaryDarkColor:AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(25)
              ),
              child:  Center(
                  child: Text(
                  listTasbeeh[index],
                style: themeProvider.currentMode==ThemeMode.dark?
                Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.black
                ):
                Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                ),
              )
              ),
            ),

          ],
        ),
      ),
    );
  }}
