import 'package:flutter/material.dart';

// A default theme with some overrides.
final ThemeData normalTheme = ThemeData(primarySwatch: Colors.blue);

// A theme for the weather page.
final ThemeData weatherTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme:
        const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0));

const BoxDecoration clearWeatherDecoration = BoxDecoration(
    gradient: LinearGradient(colors: [Colors.blue, Colors.white]));

const BoxDecoration rainWeatherDecoration = BoxDecoration(
    gradient: LinearGradient(colors: [Colors.blueGrey, Colors.white]));

const BoxDecoration nightWeatherDecoration = BoxDecoration(
    gradient: LinearGradient(colors: [Colors.black, Colors.white]));
