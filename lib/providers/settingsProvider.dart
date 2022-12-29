import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  String currentLocal = "en";
  ThemeMode currentTheme = ThemeMode.light;

  ///B4 shared preferences
  // changeCurrentLocale(String newLocal) async {
  //   currentLocal = newLocal;
  //   notifyListeners();
  // }
  ///After shared preferences
  changeCurrentLocale(String newLocal) async {
    final preference = await SharedPreferences.getInstance();
    if(newLocal == currentLocal)
    {
      return;
    }
    currentLocal = newLocal;
    preference.setString('language', currentLocal);
    notifyListeners();
  }
  ///B4 shared preferences
  // changeCurrentMode(ThemeMode newMode) {
  //   currentTheme = newMode;
  //   notifyListeners();
  // }
///After shared preferences
  changeCurrentMode(ThemeMode newMode) async{
    final preference = await SharedPreferences.getInstance();
    if(newMode==currentTheme)
      {
        return;
      }
    currentTheme = newMode;
    preference.setString('theme', (currentTheme==ThemeMode.dark)?'dark':'light');
    notifyListeners();
  }
}
