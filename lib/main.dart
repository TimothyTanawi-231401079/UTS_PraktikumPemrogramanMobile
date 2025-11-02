import 'package:flutter/material.dart';
import 'package:uts_pemmob/config/routes.dart';
import 'package:uts_pemmob/screens/finish_screen.dart';
import 'package:uts_pemmob/screens/quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp.router(
    //
    //   title: 'Mobile Quiz',
    //   theme: ThemeData(
    //     fontFamily: "RhodiumLibre"
    //   ),
    //   routerConfig: createRouter(),
    //   debugShowCheckedModeBanner: false,
    // );
    return MaterialApp(

      title: 'Mobile Quiz',
      theme: ThemeData(
          fontFamily: "RhodiumLibre"
      ),
      home: FinishScreen(nama: 'Timothy'),
      debugShowCheckedModeBanner: false,
    );
  }
}