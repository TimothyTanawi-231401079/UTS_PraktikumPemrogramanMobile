import 'package:flutter/material.dart';
import 'package:uts_pemmob/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Quiz',
      theme: ThemeData(
        fontFamily: "RhodiumLibre"
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}