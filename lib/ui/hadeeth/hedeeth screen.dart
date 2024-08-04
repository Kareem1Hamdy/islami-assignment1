import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/components/functions.dart';
import 'package:islami/providers/themeProvider.dart';
import 'package:islami/themes/appThemes.dart';
import 'package:islami/ui/hadeeth/hadeeth_details_screen.dart';
import 'package:provider/provider.dart';

class HadeethScreen extends StatefulWidget {
  HadeethScreen({super.key});

  @override
  State<HadeethScreen> createState() => _HadeethScreenState();
}

class _HadeethScreenState extends State<HadeethScreen> {

  List<Hadeth> ahadeeth=[];

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider=Provider.of<ThemeProvider>(context);

    if (ahadeeth.isEmpty){
      readHadeeth();
    }
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/images/hadeth_logo.png'),
          Container(
            width: double.infinity,
            color: themeProvider.currentMode==ThemeMode.dark?
            AppTheme.secondaryDarkColor:
            AppTheme.primaryColor,
            height:3,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
                getLocal(context)!.alahadeeth,
                style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Container(
            width: double.infinity,
            color: themeProvider.currentMode==ThemeMode.dark?
            AppTheme.secondaryDarkColor:
            AppTheme.primaryColor,
            height:3,
          ),
          ahadeeth.isNotEmpty? Expanded(
            child: ListView.separated(
                itemBuilder: (context,index)=>
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context)=>HadeethDetailsScreen(
                                 title: ahadeeth[index].title,
                                  content: ahadeeth[index].content,
                                ),
                            )
                        );
                      },
                      child: Center(
                        child: Text(
                          ahadeeth[index].title,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ),
                separatorBuilder: (context,index)=>Container(
                  width: double.infinity,
                  color: themeProvider.currentMode==ThemeMode.dark?
                  AppTheme.secondaryDarkColor:
                  AppTheme.primaryColor,
                  height:1,
                ),
                itemCount: ahadeeth.length,
            ),
          ): Center(
            child: CircularProgressIndicator(
              color: themeProvider.currentMode==ThemeMode.dark?
              AppTheme.secondaryDarkColor:
              AppTheme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  void readHadeeth()async{
    String allAhadeeth=await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadeethsplit= allAhadeeth.trim().split('#');


    for(int i=0;i<hadeethsplit.length;i++){
      List<String> lines= hadeethsplit[i].trim().split('\n');

      String title=lines[0];
      List<String> content= lines;

      Hadeth hadeth=Hadeth(title: title, content: content);
      ahadeeth.add(hadeth);
    }

    setState(() {

    });
  }
}

class Hadeth{
  final String title;
  final List<String> content;

  Hadeth({required this.title,required this.content});
}
