import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.orange,
      primaryColor: Colors.orange,
      scaffoldBackgroundColor: const Color(0xfffff6f1),
      bottomAppBarColor: Colors.white,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Color(0xFFFF6E00),
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedLabelStyle: TextStyle(fontSize: 16),
        unselectedLabelStyle: TextStyle(fontSize: 16),
      ),
      fontFamily: 'Narin',
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        buttonColor: Colors.orangeAccent,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFFFF5900),
        foregroundColor: Colors.white,
      ),
      cardTheme: const CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        shadowColor: Color(0x45FF5900),
        elevation: 10,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      ),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.only(top: 6, left: 10),
        minVerticalPadding: 10,
      ),
      textTheme: TextTheme(),
      primaryTextTheme: TextTheme(),

      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: Color(0xfffff6f1),
        checkmarkColor: Colors.white,
        secondarySelectedColor: Colors.white,
        selectedColor: Colors.deepOrange,
        deleteIconColor: Colors.white,
        shape: StadiumBorder(
          side: BorderSide(color: Colors.deepOrange),
        ),
      ),

      // primaryColorLight: Color(0x000000),
      // primaryColorDark: Color(0x000000),
      // focusColor: Color(0x000000),
      // hoverColor: Color(0x000000),
      // shadowColor: Color(0x000000),
      // canvasColor: Color(0x000000),
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
      // cardTheme: CardTheme(),
      // progressIndicatorTheme: ProgressIndicatorThemeData(),
    );
  }
}
