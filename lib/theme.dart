import 'package:flutter/material.dart';

// A default theme with some overrides.
final ThemeData normalTheme = ThemeData(primarySwatch: Colors.blue);

// A theme for the weather page.
final ThemeData weatherTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme:
        const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0));

const BoxDecoration clearWeatherDecoration = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.blue, Color.fromARGB(255, 73, 207, 255)]));

const BoxDecoration rainWeatherDecoration = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.blueGrey, Color.fromARGB(255, 96, 139, 134)]));

const BoxDecoration nightWeatherDecoration = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.black, Color.fromARGB(255, 78, 76, 76)]));
