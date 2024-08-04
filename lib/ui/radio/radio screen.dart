import 'package:flutter/material.dart';
import 'package:islami/components/functions.dart';
import 'package:islami/providers/themeProvider.dart';
import 'package:islami/themes/appThemes.dart';
import 'package:provider/provider.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {

    ThemeProvider themeProvider=Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
              'assets/images/radio_image.png',
            width: 412,
            height: 222,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Text(
                getLocal(context)!.ezeaa,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: IconButton(
                    color: themeProvider.currentMode==ThemeMode.dark?
                    AppTheme.secondaryDarkColor:
                    AppTheme.primaryColor,
                    onPressed: (){},
                    icon: Icon(
                        Icons.skip_previous,
                      size: 45,
                    )
                ),
              ),
              Expanded(
                child: IconButton(
                    color: themeProvider.currentMode==ThemeMode.dark?
                    AppTheme.secondaryDarkColor:
                    AppTheme.primaryColor,
                    onPressed: (){},
                    icon: Icon(
                        Icons.play_arrow,
                      size: 60,
                    )
                ),
              ),
              Expanded(
                child: IconButton(
                    color: themeProvider.currentMode==ThemeMode.dark?
                    AppTheme.secondaryDarkColor:
                    AppTheme.primaryColor,
                    onPressed: (){},
                    icon: Icon(
                        Icons.skip_next,
                      size: 45,
                    )
                ),
              ),
            ],
          )

        ],
      ),
    );
  }
}
