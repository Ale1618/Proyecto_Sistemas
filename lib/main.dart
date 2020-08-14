import 'package:covid19/datasource.dart';
import 'package:covid19/homepage.dart';
import 'package:covid19/paginas/splash_pagina.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      data: (brightness) {
        return ThemeData(
            primaryColor: primaryBlack,
            fontFamily: 'Circular',
            brightness: brightness == Brightness.light
                ? Brightness.light
                : Brightness.dark,
            scaffoldBackgroundColor: brightness == Brightness.dark
                ? Colors.blueGrey[900]
                : Colors.white);
      },
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          title: "Covid 19",
          home: SlashPage(),
        );
      },
    );
  }
}
