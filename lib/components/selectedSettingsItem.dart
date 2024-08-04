import 'package:flutter/material.dart';
import 'package:islami/themes/appThemes.dart';

class SelectedSettingsItem extends StatelessWidget {
   SelectedSettingsItem({super.key, required this.selectedText});

  final String selectedText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          selectedText,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: AppTheme.secondaryDarkColor,
          ),

        ),
        Icon(
          Icons.check,
          color: AppTheme.secondaryDarkColor,
        )

      ],
    );
  }
}
