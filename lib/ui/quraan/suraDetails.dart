import 'package:flutter/material.dart';
import 'package:islami/components/defaultScaffold.dart';
import 'package:islami/themes/appThemes.dart';

class SuraDetails extends StatelessWidget {
  SuraDetails({this.suraDetails,required this.suraName,super.key});


 String suraName;
 String? suraDetails;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        body: Card(
          margin: const EdgeInsets.all(30),
          elevation: 10,
          color: Colors.white.withOpacity(0.8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      ' سورة $suraName ',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  SizedBox(width: 15,),
                  IconButton(
                      onPressed: (){},
                      icon:Icon(
                          Icons.play_circle,
                        size: 27,
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

            ],
          ),
        )
    );
  }
}
