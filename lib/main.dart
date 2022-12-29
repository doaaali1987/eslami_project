import 'package:eslami_project/providers/settingsProvider.dart';
import 'package:eslami_project/screens/ahadeth_details/ahadeth_details_screen.dart';
import 'package:eslami_project/screens/home/home_screen.dart';
import 'package:eslami_project/screens/sura_details/sura_details_screen.dart';
import 'package:eslami_project/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(ChangeNotifierProvider(
      create: (context)=>SettingsProvider(),
      child: MyApp()));
}
class MyApp extends StatelessWidget {
  late SettingsProvider provider;
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    provider=Provider.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      //theme:ThemeHelper.darkTheme,
      theme: ThemeHelper.lightTheme,
      themeMode: provider.currentTheme,
      darkTheme: ThemeHelper.darkTheme,
      routes: {
        //QuranScreen.routeName:(_) =>QuranScreen(),
        HomeScreen.routeName:(_)=>HomeScreen(),
        SuraDetailsScreen.routeName:(_)=>SuraDetailsScreen(),
        HadethDetailsScreen.routeName:(_)=>HadethDetailsScreen(),
      },
      initialRoute: HomeScreen.routeName,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale("en"),Locale("ar")],
      //locale: Locale("en"),
      locale: Locale(provider.currentLocal),
    );
  }
}
