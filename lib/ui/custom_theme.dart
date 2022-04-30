import 'package:flutter/material.dart';

// PINK -> BLUE
// Color _primary = Color(0xffff9a8d);
// Color _secondary = Color(0xff4a536b);
// Color _thirdColor = Colors.white;
// Color _onPrimary = Colors.black;
// Color _onSecondary = Colors.white;

// DARK BLUE -> DEEP ORANGE
// Color _primary = Color(0xffd2601a);
// Color _secondary = Color(0xff1d3c45);
// Color _thirdColor = Colors.white;
// Color _onPrimary = Colors.white;
// Color _onSecondary = Colors.white;

// GREEN -> ORANGE
// Color _primary = Color(0xffd2601a);
// Color _secondary = Color(0xff3a6b35);
// Color _thirdColor = Colors.white;
// Color _onPrimary = Colors.white;
// Color _onSecondary = Colors.white;

// GREEN -> BROWN
// Color _primary = Color(0xff9e6111);
// Color _secondary = Color(0xff587148);
// Color _thirdColor = Colors.white;
// Color _onPrimary = Colors.white;
// Color _onSecondary = Colors.white;

// analogous GREEN
// Color _primary = Color(0xff2B6561);
// Color _secondary = Color(0xff61CC89);
// Color _thirdColor = Colors.white;
// Color _onPrimary = Colors.white;
// Color _onSecondary = Colors.black;

Color _primary = Color(0xffa6b64d);
Color _secondary = Color(0xff297A32);
Color _thirdColor = Colors.white;
Color _onPrimary = Colors.black;
Color _onSecondary = Colors.white;

ColorScheme _customColorScheme = ColorScheme(
  primary: _primary,
  secondary: _secondary,
  surface: Colors.white,
  background: Color(0xffFFEBCC),
  error: Colors.red.shade100,
  onPrimary: _onPrimary,
  onSecondary: _onSecondary,
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
        backgroundColor: _thirdColor,
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
      chipTheme: ChipThemeData(
        shape: StadiumBorder(side: BorderSide(color: _primary)),
        backgroundColor: Colors.white,
        selectedColor: _primary,
        checkmarkColor: _onPrimary,
        deleteIconColor: _onPrimary,
      ),

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
