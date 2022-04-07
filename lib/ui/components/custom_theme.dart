import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.orange,
      primaryColor: Colors.orange,
      scaffoldBackgroundColor: const Color(0xfff1e5d9),
      bottomAppBarColor: Color(0xFFFF6E00),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFFFF6E00),
        elevation: 0,
      ),
      fontFamily: 'Narin',
      buttonTheme: ButtonThemeData(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: Colors.orangeAccent,
      ),
      // primaryColorLight: Color(0x000000),
      // primaryColorDark: Color(0x000000),
      // focusColor: Color(0x000000),
      // hoverColor: Color(0x000000),
      // shadowColor: Color(0x000000),
      // canvasColor: Color(0x000000),
      // bottomAppBarColor: Color(0x000000),
      // cardColor: Color(0x000000),
      // dividerColor: Color(0x000000),
      // highlightColor: Color(0x000000),
      // splashColor: Color(0x000000),
      // selectedRowColor: Color(0x000000),
      // unselectedWidgetColor: Color(0x000000),
      // disabledColor: Color(0x000000),
      // secondaryHeaderColor: Color(0x000000),
      // backgroundColor: Color(0x000000),
      // dialogBackgroundColor: Color(0x000000),
      // indicatorColor: Color(0x000000),
      // hintColor: Color(0x000000),
      // errorColor: Color(0x000000),
      // textTheme: TextTheme(),
      // primaryTextTheme: TextTheme(),
      // cardTheme: CardTheme(),
      // chipTheme: ChipThemeData(),
      // floatingActionButtonTheme: FloatingActionButtonThemeData(),
      // listTileTheme: ListTileThemeData(),
      // progressIndicatorTheme: ProgressIndicatorThemeData(),
    );
  }
}
