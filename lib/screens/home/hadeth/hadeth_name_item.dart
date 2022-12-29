import 'package:eslami_project/theme_helper.dart';
import 'package:eslami_project/screens/ahadeth_details/ahadeth_details_screen.dart';
import 'package:eslami_project/screens/home/hadeth/hadeth_tap.dart';
import 'package:flutter/material.dart';

class HadethNameItem extends StatelessWidget {
  AhadethModel  hadeth ;
  HadethNameItem(this.hadeth);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, HadethDetailsScreen.routeName,arguments: hadeth);
      },
      child: Container(
        child:Column(
          children: [
            Text(hadeth.title,
               // style:TextStyle(fontSize: 22,color:ThemeHelper.item,fontWeight: FontWeight.bold,fontFamily:"El Messiri")),
          style:Theme.of(context).textTheme.bodyMedium),
            Divider(thickness: 1,color: ThemeHelper.primaryColorLight,),
          ],
        ),
      ),
    );
  }
}
