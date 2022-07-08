import 'package:flutter/material.dart';
import 'package:flutter_study_tcs/HomeWidget/AppHomeePage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'app框架',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Georgia',
        // brightness: Brightness.dark,
        textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 36.0, fontWeight: FontWeight.bold, color: Colors.black),
            headline2: TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
            headline3: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
            headline4: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            headline6: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
            bodyText1: TextStyle(fontSize: 20, fontWeight: FontWeight.w200)),
      ),
      home: AppHomeePage(),
    );
  }
}