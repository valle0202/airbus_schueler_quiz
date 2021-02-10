import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:schueler_quiz_web_app/Screens/Quiz/question1.dart';
import 'package:schueler_quiz_web_app/Screens/Quiz/question2.dart';
import 'package:schueler_quiz_web_app/Screens/Quiz/question3.dart';
import 'package:schueler_quiz_web_app/Screens/Quiz/question4.dart';
import 'package:schueler_quiz_web_app/Screens/Quiz/question5.dart';
import 'package:schueler_quiz_web_app/Screens/Quiz/question6.dart';
import 'package:schueler_quiz_web_app/Screens/Quiz/question7.dart';
import 'package:schueler_quiz_web_app/Screens/Quiz/question8.dart';
import 'package:schueler_quiz_web_app/Screens/Quiz/question9.dart';
import 'package:schueler_quiz_web_app/constants.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  int selectedIndex = 0;
  int tipsLeft = 5;

  Timer _timer;
  int seconds = 0;
  int minutes = 0;
  //int hours = 0;
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (seconds < 0) {
            timer.cancel();
          } else {
            seconds += 1;
            if (seconds > 59) {
              minutes += 1;
              seconds = 0;
              /*if (minutes > 59) {
                hours += 1;
                minutes = 0;
              }*/
            }
          }
        },
      ),
    );
  }
  
  onItemClicked(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  List quizPunkte = [3,4,6,7,3,2,4,3,7];

  List quizWidgets = [
    question1(),
    question2(),
    question3(),
    question4(),
    question5(),
    question6(),
    question7(),
    question8(),
    question9(),
  ] ;

  Widget bottomNavBar () {
    return Scaffold(
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 200),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Punkte: " + quizPunkte[selectedIndex].toString()),
                    Text(minutes.toString() + ':' + seconds.toString()),
                    TextButton(
                      onPressed: (){setState(() {tipsLeft--;});}, 
                      child: Text("Tip (" + tipsLeft.toString() + " übrig)")
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: quizWidgets.elementAt(selectedIndex),
            //child: Text("$selectedIndex"),
            ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.airplanemode_active),
            label: "1",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_on),
            label: "2",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alt_route),
            label: "3",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cases),
            label: "4",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.no_encryption),
            label: "5",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.code),
            label: "6",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.coronavirus),
            label: "7",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hearing),
            label: "8",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.vertical_split),
            label: "9",
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onItemClicked,
      ),
    );
  }

  @override
  void initState(){
    startTimer();
    super.initState();
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