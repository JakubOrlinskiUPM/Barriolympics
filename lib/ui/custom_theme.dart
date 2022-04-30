import 'package:flutter/material.dart';

Color _primary = Color(0xfff9d10f);
Color _secondary = Color(0xff3b4d61);

ColorScheme _customColorScheme = ColorScheme(
  primary: _primary,
  secondary: _secondary,
  surface: Colors.white,
  background: Color(0xffFFEBCC),
  error: Colors.red.shade100,
  onPrimary: Colors.black,
  onSecondary: Colors.white,
  onSurface: Colors.black,
  onBackground: Colors.black,
  onError: Colors.black,
  brightness: Brightness.light,
);

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: _customColorScheme,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        selectedLabelStyle: TextStyle(fontSize: 16),
        unselectedLabelStyle: TextStyle(fontSize: 14),
      ),
      fontFamily: 'Narin',
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
      ),
      cardTheme: const CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        elevation: 10,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      ),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.only(top: 6, left: 10),
        minVerticalPadding: 10,
      ),
      textTheme: const TextTheme(),
      primaryTextTheme: const TextTheme(),

      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(
            _secondary,
          ),
        ),
      ),
      chipTheme: const ChipThemeData(),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
              side: BorderSide(
                color: _primary,
              ),
            ),
          ),
          foregroundColor: MaterialStateProperty.all(
            _secondary,
          ),
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
