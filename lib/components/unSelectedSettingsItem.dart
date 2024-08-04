import 'package:flutter/material.dart';
import 'package:islami/providers/themeProvider.dart';
import 'package:provider/provider.dart';

class UnselectedSettingsItem extends StatelessWidget {
  const UnselectedSettingsItem({super.key, required this.unselectedText});

  final String unselectedText;
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider=Provider.of<ThemeProvider>(context);
    return Container(
      width: double.infinity,
      child: Text(
        unselectedText,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: themeProvider.currentMode==ThemeMode.dark?
                Colors.white:Colors.black,
        ),
      ),
    );
  }
}
