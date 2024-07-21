import 'package:flutter/material.dart';

class DefaultScaffold extends StatelessWidget {

  AppBar? appBar;
  BottomNavigationBar? bottomNavigationBar;
  Widget? body;

  DefaultScaffold({AppBar? appBar, BottomNavigationBar? bottomNavigationBar, required Widget? body,}){

    appBar!=null? appBar :this.appBar=AppBar(
      title:  Center(
        child: Text('Islami'),
      ),
    );
    this.bottomNavigationBar=bottomNavigationBar;
    this.body=body;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
