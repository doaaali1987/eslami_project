import 'package:eslami_project/screens/sura_details/sura_details_arguments.dart';
import 'package:eslami_project/screens/sura_details/sura_details_screen.dart';
import 'package:eslami_project/theme_helper.dart';
import 'package:flutter/material.dart';

class SuraNameItem extends StatelessWidget {
String suraName;
int index;
SuraNameItem(this.suraName,this.index);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, SuraDetailsScreen.routeName,arguments: SuraDetailsArguments(suraName, "${index+1}.txt"));
      },
      child: Container(
        child:Column(
          children: [
            Text(suraName,
                style:Theme.of(context).textTheme.bodyMedium),
            Divider(thickness: 1,color: ThemeHelper.primaryColorLight,),
          ],
        ),
      ),
    );
  }
}
