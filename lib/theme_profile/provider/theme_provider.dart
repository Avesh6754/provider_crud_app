import 'package:flutter/material.dart';

class ProfileThemeProvider {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xffffffff),

    // brightness: Brightness.light,
    textTheme: TextTheme(titleSmall: TextStyle(color: Colors.black)),
    colorScheme: const ColorScheme.light(
      primary: Colors.pink, //switch color
      secondary: Colors.green, // grid color
      surface: Colors.blue, // setting icon color
      onPrimary: Colors.brown, //message icon color
      onSecondary: Colors.grey,
    ),
  );

  //DarkTheme
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff000000),
    // brightness: Brightness.light,
    textTheme: TextTheme(titleSmall: TextStyle(color: Colors.white)),
    colorScheme: const ColorScheme.light(
      primary: Colors.amber, //switch color
      secondary: Colors.lightBlue, // grid icon color
      surface: Colors.pinkAccent, //setting icon color
      onPrimary: Colors.lightGreen, // message icon color
      onSecondary: Colors.white,
    ),
  );

}