import 'package:eslami_project/providers/settingsProvider.dart';
import 'package:eslami_project/screens/home/settings/languageBottomSheet.dart';
import 'package:eslami_project/screens/home/settings/themeBottomSheet.dart';
import 'package:eslami_project/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 30,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(AppLocalizations.of(context)!.languages,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleMedium),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                onTap: () {
                  showLanguageBottomSheet();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                    border: Border.all(color:ThemeHelper.primaryColorLight, width: 2),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Text(
                          provider.currentLocal == "en" ? "English" : "العربية",
                          style: Theme.of(context).textTheme.bodyMedium,),
                      Spacer(),
                      Icon(Icons.arrow_downward)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(AppLocalizations.of(context)!.theme,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleMedium),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                onTap: () {
                  showThemeBottomSheet();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                    border: Border.all(color:ThemeHelper.primaryColorLight, width: 2),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      //Text(provider.currentLocal == "en" ? "Light" : "فاتح",
                      Text(provider.currentTheme == ThemeMode.dark ?
                      AppLocalizations.of(context)!.dark :AppLocalizations.of(context)!.light,
                        style: Theme.of(context).textTheme.bodyMedium,),
                      Spacer(),
                      Icon(Icons.arrow_downward)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  void showLanguageBottomSheet(){
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(150))),
        context: context,
        builder: (context) {
          return LanguageBottomSheet();
        });
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return ThemeBottomSheet();
        });
  }
}
