import 'package:flutter/material.dart';

final darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellowAccent),
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.black,
    dividerColor: Colors.white10,
    popupMenuTheme: const PopupMenuThemeData(
      iconColor: Colors.yellowAccent,
      color: Colors.white24,
//      textStyle: TextStyle(color: Colors.yellowAccent, fontSize: 20, fontWeight: FontWeight.w700)
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        elevation: 0,
        titleTextStyle: TextStyle(color: Colors.yellowAccent, fontSize: 20, fontWeight: FontWeight.w700)
    ),
    listTileTheme: const ListTileThemeData(iconColor: Colors.yellowAccent),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
          color: Colors.yellow,
          fontWeight: FontWeight.w700,
          fontSize: 20
      ),
      labelSmall: TextStyle(
          color: Colors.yellowAccent,
          fontWeight: FontWeight.w700,
          fontSize: 12
      ),
    )
);