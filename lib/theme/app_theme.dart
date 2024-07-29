import 'package:flutter/material.dart';

const Map<int, Color> color = {
  50: Color.fromRGBO(65, 87, 255, .1),
  100: Color.fromRGBO(65, 87, 255, .2),
  200: Color.fromRGBO(65, 87, 255, .3),
  300: Color.fromRGBO(65, 87, 255, .4),
  400: Color.fromRGBO(65, 87, 255, .5),
  500: Color.fromRGBO(65, 87, 255, .6),
  600: Color.fromRGBO(65, 87, 255, .7),
  700: Color.fromRGBO(65, 87, 255, .8),
  800: Color.fromRGBO(65, 87, 255, .9),
  900: Color.fromRGBO(65, 87, 255, 1),
};

const MaterialColor customSwatch = MaterialColor(0xFF4157FF, color);
const Color customBlue = Color(0xFF4157FF);

const TextTheme appTextTheme = TextTheme(
  displaySmall: TextStyle(fontFamily: 'Overpass', fontWeight: FontWeight.bold),
  bodyLarge: TextStyle(fontFamily: 'Overpass', fontSize: 14),
  bodyMedium: TextStyle(fontFamily: 'Overpass', fontSize: 16),
  displayLarge: TextStyle(fontFamily: 'Overpass', fontWeight: FontWeight.bold),
  displayMedium: TextStyle(fontFamily: 'Overpass', fontWeight: FontWeight.bold),
  labelLarge: TextStyle(fontFamily: 'Overpass', fontWeight: FontWeight.bold),
);

final ThemeData appTheme = ThemeData(
  primarySwatch: customSwatch,
  fontFamily: 'Overpass',
  textTheme: appTextTheme,
);
