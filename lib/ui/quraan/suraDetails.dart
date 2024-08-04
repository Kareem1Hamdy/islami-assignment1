import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/components/defaultScaffold.dart';
import 'package:islami/providers/themeProvider.dart';
import 'package:islami/themes/appThemes.dart';
import 'package:provider/provider.dart';

class SuraDetails extends StatefulWidget {
  SuraDetails({required this.index,required this.suraName,super.key});


 String suraName;
 int index;

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
 List<String> listLines=[];


  @override
  Widget build(BuildContext context) {

    ThemeProvider themeProvider=Provider.of<ThemeProvider>(context);

        if(listLines.isEmpty){
          readFile(widget.index);
        }

    return DefaultScaffold(
        body: Card(
          margin: const EdgeInsets.all(30),
          elevation: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      ' سورة ${widget.suraName} ',
                    style: themeProvider.currentMode==ThemeMode.dark?
                    Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppTheme.secondaryDarkColor
                    ):
                    Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(width: 15,),
                  IconButton(
                      onPressed: (){},
                      icon:Icon(
                          Icons.play_circle,
                        size: 27,
                        color: themeProvider.currentMode==ThemeMode.dark?
                        AppTheme.secondaryDarkColor:
                        Colors.black,
                      ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                  width: double.infinity,
                  color: AppTheme.primaryColor,
                  height:1,
                ),
              listLines.isNotEmpty?
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${listLines[index]}${{index+1}}',
                          textDirection: TextDirection.rtl,
                            style: themeProvider.currentMode==ThemeMode.dark?
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: AppTheme.secondaryDarkColor
                            ):
                            Theme.of(context).textTheme.bodyMedium,
                        ),
                      );

                    },
                    separatorBuilder: (context,index)=>Container(
                      width: double.infinity,
                      color: AppTheme.primaryColor,
                      height:1,
                    ),
                    itemCount: listLines.length,
                ),
              )
                  :  Center(child: CircularProgressIndicator(
                color: themeProvider.currentMode==ThemeMode.dark?
                AppTheme.secondaryDarkColor:
                AppTheme.primaryColor,
              )),

            ],
          ),
        ),
      context: context,
    );
  }

  void readFile(int fileIndex)async{
    String fileContent= await rootBundle.loadString('assets/files/${fileIndex+1}.txt');
    List<String> lines= fileContent.trim().split('\n');
    setState(() {
      listLines= lines;
    });
  }
}
