import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_pemmob/config/routes.dart';
import 'package:uts_pemmob/provider/app_state_provider.dart';
import 'package:uts_pemmob/screens/quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppStateProvider(),
      child: MaterialApp.router(
        title: 'Mobile Quiz',
        theme: ThemeData(
          fontFamily: "RhodiumLibre",
        ),
        routerConfig: createRouter(),
        debugShowCheckedModeBanner: false,
      ),
    );
    // return MaterialApp(
    //   title: 'Mobile Quiz',
    //       theme: ThemeData(
    //         fontFamily: "RhodiumLibre",
    //       ),
    //       home: QuizScreen(id: '1'),
    //       debugShowCheckedModeBanner: false,
    // );

  }
}