import 'package:eslami_project/providers/settingsProvider.dart';
import 'package:eslami_project/screens/home/hadeth/hadeth_tap.dart';
import 'package:eslami_project/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HadethDetailsScreen extends StatefulWidget {
  static String routeName = "hadeth details";

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    SettingsProvider provider=Provider.of(context);
    var argsHadeth = ModalRoute.of(context)!.settings.arguments as AhadethModel;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image:provider.currentTheme==ThemeMode.light?
              AssetImage("assets/default_bg.png"):AssetImage("assets/dark_bg.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            argsHadeth.title,
            style:Theme.of(context).textTheme.titleMedium,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 25,),
                Text((argsHadeth.content),style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,),
                //Divider(thickness: 3,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
