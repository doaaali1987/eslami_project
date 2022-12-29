import 'package:eslami_project/providers/settingsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeBottomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider=Provider.of(context);
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.02),
      height: MediaQuery.of(context).size.height*.25,
      decoration: BoxDecoration(
          color:Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(100)),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              provider.changeCurrentMode(ThemeMode.light);
            },
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width*.50,
              height: MediaQuery.of(context).size.height*.07,
              decoration: BoxDecoration(color: Colors.white,
                borderRadius:BorderRadius.circular(15),border: Border.all(width: 3),),
              child: Text(AppLocalizations.of(context)!.light,style:TextStyle(fontSize: 25)),
            ),
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: (){
              provider.changeCurrentMode(ThemeMode.dark);
            },
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width*.50,
              height: MediaQuery.of(context).size.height*.07,
              decoration: BoxDecoration(color: Colors.white,
                borderRadius:BorderRadius.circular(15),border: Border.all(width: 3),),
                child: Text(AppLocalizations.of(context)!.dark,style: TextStyle(fontSize: 25)),
            ),
          ),
      ]),
    );
  }
}
