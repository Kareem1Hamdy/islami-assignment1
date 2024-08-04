import 'package:flutter/material.dart';
import 'package:islami/components/functions.dart';
import 'package:islami/components/selectedSettingsItem.dart';
import 'package:islami/components/unSelectedSettingsItem.dart';
import 'package:islami/providers/localProvider.dart';
import 'package:islami/providers/themeProvider.dart';
import 'package:islami/themes/appThemes.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
   SettingsScreen({super.key});

  double? heightOfScreen;

  ThemeProvider? themeProvider;
  LocalProvider? localProvider;

  @override
  Widget build(BuildContext context) {

    themeProvider=Provider.of<ThemeProvider>(context);
    localProvider=Provider.of<LocalProvider>(context);

    heightOfScreen=MediaQuery.sizeOf(context).height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              getLocal(context)!.themeSettings,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 5,),
          GestureDetector(
            onTap: (){
              changeTheme(context);
            },
            child: Container(
              padding: const EdgeInsetsDirectional.only(start: 15,top: 5,bottom: 5),
              margin: const EdgeInsets.only(left: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                    color: AppTheme.secondaryDarkColor,
                  width: 2
                ),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Text(
                themeProvider!.currentMode==ThemeMode.dark?
                getLocal(context)!.themeDarkOption:
                getLocal(context)!.themeLightOption,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppTheme.secondaryDarkColor,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Text(
            getLocal(context)!.languageSettings,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 5,),
          GestureDetector(
            onTap: (){
              changeLanguage(context);
            },
            child: Container(
              padding: const EdgeInsetsDirectional.only(start: 15,top: 5,bottom: 5),
              margin: const EdgeInsets.only(left: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: AppTheme.secondaryDarkColor,
                      width: 2
                  ),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Text(
                localProvider!.currentLanguage=='ar'?
                getLocal(context)!.language2Option:
                getLocal(context)!.language1Option,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppTheme.secondaryDarkColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }



  void changeTheme(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (context)=>Container(
          padding: const EdgeInsets.all(15),
           width: double.infinity,
           height: heightOfScreen!*0.5,
          color: themeProvider!.currentMode==ThemeMode.light?
              Colors.white
              :AppTheme.primaryDarkColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           GestureDetector(
                onTap: (){
                  themeProvider!.changeTheme(ThemeMode.light);
                  Navigator.pop(context);
                },
                child: themeProvider!.currentMode==ThemeMode.light?
                SelectedSettingsItem(
                    selectedText: getLocal(context)!.themeLightOption,
                 ): UnselectedSettingsItem(unselectedText: getLocal(context)!.themeLightOption,)
              ),
           const SizedBox(height: 20,),
           GestureDetector(
             onTap: (){
               themeProvider!.changeTheme(ThemeMode.dark);
               Navigator.pop(context);
             },
             child: themeProvider!.currentMode==ThemeMode.dark?
                 SelectedSettingsItem(selectedText: getLocal(context)!.themeDarkOption,)
             :UnselectedSettingsItem(
                unselectedText: getLocal(context)!.themeDarkOption,
                )
           ),
            ]
    ),
    )
    );
  }

   void changeLanguage(BuildContext context){
     showModalBottomSheet(
         context: context,
         builder: (context)=>Container(
           padding: EdgeInsets.all(15),
           width: double.infinity,
           height: heightOfScreen!*0.5,
           color: themeProvider!.currentMode==ThemeMode.dark?
               AppTheme.primaryDarkColor:Colors.white,
           child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 GestureDetector(
                   onTap: (){
                     localProvider!.changeLanguage('en');
                     Navigator.pop(context);
                   },
                   child: localProvider!.currentLanguage=='en'?
                   SelectedSettingsItem(
                     selectedText: getLocal(context)!.language1Option,
                   ):UnselectedSettingsItem(unselectedText: getLocal(context)!.language1Option),
                 ),
                 const SizedBox(height: 10,),
                 GestureDetector(
                   onTap: (){
                     localProvider!.changeLanguage('ar');
                     Navigator.pop(context);
                   },
                   child: localProvider!.currentLanguage=='en'?
                   UnselectedSettingsItem(
                     unselectedText: getLocal(context)!.language2Option,
                   ):SelectedSettingsItem(selectedText: getLocal(context)!.language2Option,),
                 ),
               ]
           ),
         )
     );
   }
}
