import 'package:flutter/material.dart';
import 'package:islami/components/defaultScaffold.dart';
import 'package:islami/providers/themeProvider.dart';
import 'package:islami/themes/appThemes.dart';
import 'package:provider/provider.dart';

class HadeethDetailsScreen extends StatelessWidget {
   HadeethDetailsScreen({required this.title,required this.content,super.key});

  String title;
  List<String> content;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider=Provider.of<ThemeProvider>(context);
    return DefaultScaffold(
        body: Card(
          margin: const EdgeInsets.all(30),
          elevation: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: themeProvider.currentMode==ThemeMode.dark?
                Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppTheme.secondaryDarkColor
                ):
                Theme.of(context).textTheme.titleMedium,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                width: double.infinity,
                color: themeProvider.currentMode==ThemeMode.dark?
                AppTheme.secondaryDarkColor:
                AppTheme.primaryColor,
                height:1,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        content[index+1],
                        textDirection: TextDirection.rtl,
                        style: themeProvider.currentMode==ThemeMode.dark?
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppTheme.secondaryDarkColor
                      ):
                        Theme.of(context).textTheme.bodyMedium,
                      ),
                    );

                  },
                  itemCount: content.length-1,
                ),
              )
            ],
          ),
        ),
      context: context,
    );
  }
}
