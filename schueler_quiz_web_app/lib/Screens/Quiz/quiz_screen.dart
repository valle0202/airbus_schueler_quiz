import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:schueler_quiz_web_app/constants.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  Widget bottomNavBar () {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.airplanemode_active),
          label: "1",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.airplanemode_active),
          label: "2",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.airplanemode_active),
          label: "4",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.airplanemode_active),
          label: "5",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.airport_shuttle),
          label: "6",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.airplanemode_active),
          label: "7",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.airplanemode_active),
          label: "8",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.airplanemode_active),
          label: "9",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.airplanemode_active),
          label: "10",
        ),
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: greenSuccess,
        child: Text('save', style: TextStyle(fontSize: 20),),
        onPressed: (){},
      ),
    );
  }
}