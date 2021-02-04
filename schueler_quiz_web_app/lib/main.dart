import 'package:flutter/material.dart';
import 'package:schueler_quiz_web_app/Screens/home_screen.dart';
import 'package:schueler_quiz_web_app/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryBlue,
        
      ),
      home: HomeScreen(),
    );
  }
}

