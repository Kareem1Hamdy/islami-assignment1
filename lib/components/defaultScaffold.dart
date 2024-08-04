import 'package:flutter/material.dart';
import 'package:islami/components/functions.dart';
import 'package:islami/providers/themeProvider.dart';
import 'package:islami/themes/appThemes.dart';
import 'package:provider/provider.dart';

class DefaultScaffold extends StatelessWidget {

  AppBar? appBar;
  BottomNavigationBar? bottomNavigationBar;
  Widget? body;
  BuildContext context;

  DefaultScaffold({AppBar? appBar, BottomNavigationBar? bottomNavigationBar, required Widget? body,required this.context}){

    appBar!=null? appBar :this.appBar=AppBar(
      title:  Center(
        child: Text(
            getLocal(context)!.appBarTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
    this.bottomNavigationBar=bottomNavigationBar;
    this.body=body;
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider=Provider.of<ThemeProvider>(context);
    return Stack(
      children: [
        themeProvider.currentMode==ThemeMode.dark?
        Image.asset('assets/images/dark_bg.png'):
        Image.asset('assets/images/background_image.jpg'),
        Scaffold(
          appBar:appBar,
          bottomNavigationBar: bottomNavigationBar,
          body: body,
        ),
      ],
    );
  }
}
