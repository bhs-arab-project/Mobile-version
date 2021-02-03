import 'package:flutter/material.dart';
import 'package:bahasa_arab/constants.dart';
import 'package:bahasa_arab/ui/uis.dart';
import 'package:hexcolor/hexcolor.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bahasa Arab',
        theme: ThemeData(
            scaffoldBackgroundColor: kBackgorundColor,
            primaryColor: HexColor("#fab838"),
            textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
            visualDensity: VisualDensity.adaptivePlatformDensity),
        initialRoute: '/',
        routes: {
          // HOME
          '/': (context) => Screen(),
          '/app': (context) => MyApp(),
          // QUIZ
          // BEGINNER
          '/begconfirm': (context) => Begconfirm(),
          '/beginner': (context) => Beginner(),
          // INTERMEDIATE
          '/inconfirm': (context) => Inconfirm(),
          '/intermediate': (context) => Intermediate(),
          // ADVANCE
          '/inadvance': (context) => Inadvance(),
          '/advsession': (context) => Advsession(),
          '/advance': (context) => Advance(),
          // LEARNING
          // BEGINNER
          '/interlearn': (context) => InterLearn(),
          // Form
          '/login': (context) => Login(),
          // Mapel
          '/daftar': (context) => Learning(),
          '/list': (context) => ListMateri(),
          '/belajar': (context) => Pembelajaran(),
        });
  }
}
