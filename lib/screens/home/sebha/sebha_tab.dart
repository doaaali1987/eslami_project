import 'package:eslami_project/providers/settingsProvider.dart';
import 'package:eslami_project/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double angle = 0;
  int counter = 0;
  int index = 0;
  List<String> azkar = [
    "سبحان الله",
    "الحمدلله",
    "لا إله إلا الله",
    "الله أكبر"
  ];
  void rotateSebha() {
    angle--;
    counter++;
    if (counter == 34) {
      index++;
      counter = 0;
    }
    if(index>azkar.length-1) {
      index=0;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              rotateSebha();
            },
            child: Container(
              height: MediaQuery.of(context).size.height * .45,
              child: Stack(
                children: [
                  Positioned(
                      left: MediaQuery.of(context).size.width * .45,
                      child: provider.currentTheme == ThemeMode.light
                          ? Image.asset('assets/head_sebha_logo.png')
                          : Image.asset('assets/head_sebha_dark.png')),
                  Positioned(
                      left: MediaQuery.of(context).size.width * .17,
                      top: MediaQuery.of(context).size.height * .11,
                      child: Transform.rotate(
                          angle: angle,
                          child: Image.asset('assets/body_sebha_logo.png')))
                ],
              ),
            ),
          ),
          Text("عدد التسبيحات",style: TextStyle(fontFamily:'ElMessiri',fontSize: 25)),
          SizedBox(
            height: 18,
          ),
          Container(
            //padding: EdgeInsets.symmetric(vertical: 25,horizontal: 28), //OR Alignment
            alignment: Alignment.center,
            width: 70,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: ThemeHelper.primaryColorLight),
            child: Text("${counter}",style: TextStyle(color: ThemeHelper.titleAppBarDark)),
          ),
          SizedBox(
            height: 18,
          ),
          Container(
            //padding: EdgeInsets.symmetric(vertical: 25,horizontal: 28), //OR Alignment
            alignment: Alignment.center,
            width: 170,
            height: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: ThemeHelper.primaryColorLight),
            child: Text(azkar[index],style: TextStyle(color: ThemeHelper.titleAppBarDark),),
          ),
        ],
      ),
    );
  }
}
