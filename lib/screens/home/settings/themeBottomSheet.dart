import 'package:eslami_project/providers/settingsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider=Provider.of(context);
    return Container(
      //color: Colors.yellow,
      child: Column(

        children: [
          InkWell(
            onTap: (){
              provider.changeCurrentLocale("en");
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("English"),
            ),
          ),
          InkWell(
            onTap: (){
              provider.changeCurrentLocale("ar");
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("العربية"),
            ),
          ),
        ],
      ),
    );
  }
}
