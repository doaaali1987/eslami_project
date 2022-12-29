import 'package:flutter/material.dart';

class ThemeHelper {
  static Color titleAppBarLight=const Color(0xff242424);
  static Color titleAppBarDark=const Color(0xffF5f1eb);
  static Color titleItemLight=const Color(0xff62420E);
  static Color titleItemDark=const Color(0xffB7935F);
  static Color itemListLight=const Color(0xff62420E);
  static Color itemListDark=const Color(0xffEed3a5);
  static Color navBottomBarLight=const Color(0xffb7935f);
  static Color navBottomBarDark=const Color(0xff141A2E);
  static Color primaryColorLight = const Color(0xffb7935f);
  static Color accentColor = const Color(0xff62420E);
  static Color primaryDarkColor = const Color(0xffB7935F);
  static Color accentColorDark = const Color(0xff141A2E);
  static Color dropDownListItemLight = const Color(0xff242424); //still unused
  static Color dropDownListItemDark = const Color(0xff242424);  //still unused
  static ThemeData lightTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ThemeHelper.navBottomBarLight,
      selectedItemColor: ThemeHelper.accentColor,
    ),
    primaryColor: navBottomBarLight,
    accentColor: primaryColorLight,
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
          fontSize: 30,
          color: ThemeHelper.titleAppBarLight,
          fontWeight: FontWeight.bold,
          fontFamily: "El Messiri"),
    ),
    backgroundColor: ThemeHelper.primaryColorLight,
    textTheme: TextTheme(
      titleMedium:TextStyle(fontSize: 28, color: ThemeHelper.titleItemLight, fontWeight: FontWeight.bold) ,
      bodyMedium: TextStyle(fontSize: 22, color: ThemeHelper.itemListLight, fontWeight: FontWeight.w500),
      //bodySmall: TextStyle(fontSize: 15, color: Colors.red, fontWeight: FontWeight.bold),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: ThemeHelper.navBottomBarDark,
    selectedItemColor: ThemeHelper.navBottomBarDark,
  ),
    primaryColor: primaryDarkColor,
    accentColor: accentColorDark,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
          fontSize: 30,
          color: ThemeHelper.titleAppBarDark,
          fontWeight: FontWeight.bold,
          fontFamily: "El Messiri"),
    ),
    backgroundColor: ThemeHelper.navBottomBarDark,
    textTheme: TextTheme(
      titleMedium:TextStyle(fontSize: 28, color: ThemeHelper.titleItemDark, fontWeight: FontWeight.bold) ,
      bodyMedium: TextStyle(fontSize: 22, color: ThemeHelper.itemListDark, fontWeight: FontWeight.w500),
      //bodySmall: TextStyle(fontSize: 15, color: Colors.red, fontWeight: FontWeight.bold),
  ),
  );
}
