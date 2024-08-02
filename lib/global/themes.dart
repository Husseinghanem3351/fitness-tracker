import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

var lightTheme = ThemeData(

  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blueGrey,
    brightness: Brightness.light,
    primary: HexColor('#6a8bc3'),
    secondary: HexColor('#b8cede'),
  ),
  appBarTheme: AppBarTheme(
    color: HexColor('#ebf3f8'),
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      color: Colors.grey[500],
    ),
    hintStyle: TextStyle(color: Colors.grey[500], fontSize: 15),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: HexColor('#dddddd')),
    ),
    iconColor: Colors.black,
  ),
  scaffoldBackgroundColor: HexColor('#f9f9fa'),
  textTheme: const TextTheme(
    labelMedium: TextStyle(
      color: Colors.grey,
      fontSize: 13,
    ),
    bodySmall: TextStyle(
      color: Colors.black,
      fontSize: 15,
    ),
    bodyMedium: TextStyle(
      fontSize: 18,
      color: Colors.black,
    ),
    titleMedium: TextStyle(
        color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(
      fontSize: 24,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  ),
);

var darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blueGrey,
    brightness: Brightness.dark,
    primary: HexColor('#475368'),
    secondary: HexColor('#1b1e20'),
  ),
  appBarTheme: AppBarTheme(
    color: HexColor('#1b1b1d'),
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      color: Colors.grey[300],
    ),
    hintStyle: TextStyle(
      color: Colors.grey[300],
    ),
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(style: BorderStyle.solid, color: Colors.grey),
    ),
    iconColor: Colors.white,
  ),
  scaffoldBackgroundColor: HexColor('#0e1111'),
  // primarySwatch: Colors.grey,
  textTheme: const TextTheme(
    labelMedium: TextStyle(
      color: Colors.grey,
      fontSize: 13,
    ),
    bodySmall: TextStyle(
      color: Colors.white,
      fontSize: 15,
    ),
    bodyMedium: TextStyle(
      fontSize: 18,
      color: Colors.white,
    ),
    titleMedium: TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(
      fontSize: 24,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  ),
);
