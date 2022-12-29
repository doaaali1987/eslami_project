import 'package:eslami_project/providers/settingsProvider.dart';
import 'package:eslami_project/screens/home/hadeth/hadeth_tap.dart';
import 'package:eslami_project/screens/home/quran/quran_tab.dart';
import 'package:eslami_project/screens/home/radio/radio_tab.dart';
import 'package:eslami_project/screens/home/sebha/sebha_tab.dart';
import 'package:eslami_project/screens/home/settings/settings_tab.dart';
import 'package:eslami_project/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "home";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedItem = 0;
  List<Widget> tabs=[QuranTab(),HadethTab(),SebhaTab(),RadioTab(),SettingsTab()];
  @override
  Widget build(BuildContext context) {
    SettingsProvider provider=Provider.of(context);
    return Container(
      decoration:BoxDecoration(
          image: DecorationImage(
              //image: AssetImage("assets/default_bg.png"), fit: BoxFit.cover)),
              image: AssetImage(provider.currentTheme==ThemeMode.light?
              "assets/default_bg.png":"assets/dark_bg.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar:
        AppBar(
          elevation: 0,
          backgroundColor:Colors.transparent,
          title:
            // Text("Islami",
            Text(AppLocalizations.of(context)!.islami,
            style: Theme.of(context).appBarTheme.titleTextStyle,
            // style: const TextStyle(
            //     fontSize: 30,
            //     color: Colors.black,
            //     fontWeight: FontWeight.bold,
            //     fontFamily: "El Messiri"),
          ),
          //centerTitle: true,
        ),
        bottomNavigationBar:
        Theme(
          data: Theme.of(context).copyWith(
              canvasColor:provider.currentTheme==ThemeMode.light?ThemeHelper.navBottomBarLight:ThemeHelper.navBottomBarDark),
          child: BottomNavigationBar(
            //backgroundColor: Theme.of(context)!.bottomNavigationBarTheme.backgroundColor,
            //backgroundColor: ThemeHelper.primaryColor, //bug
            selectedItemColor: provider.currentTheme==ThemeMode.light?ThemeHelper.accentColor:ThemeHelper.navBottomBarLight,
            //showUnselectedLabels: true, // kda el labels kolha zahra lw false hatkon el selected label bs ele zahra
            currentIndex:selectedItem ,
            onTap: (clickedItem) {
              selectedItem=clickedItem;
              setState(() {});
            },
            items:  [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/icon_quran.png")),
                  //label: "quran"),
                  label:AppLocalizations.of(context)!.quranLabel),
               BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/icon_hadeth.png")),
                  //label: "hadethLabel"
              label:AppLocalizations.of(context)!.hadethLabel),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/icon_sebha.png")),
                  //label: "sebhaLabel"
                label: AppLocalizations.of(context)!.sebhaLabel),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/icon_radio.png")),
                  //label: "radioLabel"
              label:AppLocalizations.of(context)!.radioLabel),
              const BottomNavigationBarItem(
                label:"settigns",
                icon: Icon(Icons.settings)
              )
            ],
          ),
        ),
        body: tabs[selectedItem] ,
      ),
    );
  }
}
