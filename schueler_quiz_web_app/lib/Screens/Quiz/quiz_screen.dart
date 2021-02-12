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

import 'package:panorama/panorama.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  int selectedIndex = 0;
  int tipsLeft = 4;
  bool tiptaken = false;

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

  List answers = ['', '', '', '', '', '', '', '', '',];
  
  onItemClicked(int index){
    setState(() {
      selectedIndex = index;
      if(answers[selectedIndex] == ''){
        answerController.clear();
      } else {
        answerController.text = answers[selectedIndex];
      }
      tiptaken = false;
    });
  }

  List tips = ['überlege dir zuerst wie viele A320 an einem Tag produziert werden können, dann wie viele Triebwerke pro Tag übrig bleiben', 
  'tip2', 'tip2', 'Der Anfang ist 5, 3, 2, 9, 7, ', 'tip2', 'tip2', 'tip2', 'tip2', 'tip2', ];

  List answerSize = [100, 0, 100, 500, 400, 0, 600, 300, 100];

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

  Widget answer (double width) {
  return AnimatedContainer(
    curve: Curves.easeOutQuad,
    duration: Duration(milliseconds: 1500),
    width: width,
    child: Visibility(
      visible: width == 0? false:true,
      child: TextField(
        controller: answerController,
        decoration: InputDecoration(
          hintText: 'Antwort',
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: secondaryBlue, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: primaryBlue, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
        ),
        onSubmitted: (String s) {answers[selectedIndex] = s;},
      ),
    ),
  );
}

 Widget hotspotButton({String text, IconData icon, VoidCallback onPressed}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            shape: CircleBorder(),
            backgroundColor: Colors.black38,
          ),
          child: Icon(icon),
          onPressed: onPressed,
        ),
        text != null
            ? Container(
                padding: EdgeInsets.all(4.0),
                decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Center(child: Text(text)),
              )
            : Container(),
      ],
    );
  }

  Widget bottomNavBar () {
    return Scaffold(
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [ 
          Padding(
            padding: const EdgeInsets.fromLTRB(200, 20, 200, 0),
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
                      onPressed: (){setState(() {
                        if(tipsLeft > 0){
                          tipsLeft--; tiptaken = true;
                        }
                      });}, 
                      child: Text("Tip (" + tipsLeft.toString() + " übrig)")
                    ),
                  ],
                ),
              ),
            ),
          ),
          tiptaken? Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text("Tip: " + tips[selectedIndex], style: TextStyle(fontSize: 16, color: Colors.orange),),
          ) : SizedBox(height: 39,),
          Expanded(
            child: quizWidgets.elementAt(selectedIndex),
            //child: Text("$selectedIndex"),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: answer(answerSize[selectedIndex]),
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
    return MaterialApp(
      title: 'Panorama',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Panorama(
        child: Image.asset('assets/images/a.jpeg'),
        onTap: (longitude, latitude, tilt) => print('onTap: $longitude, $latitude, $tilt'),
        hotspots: [
          Hotspot(
            latitude: -15.0,
            longitude: -129.0,
            width: 90,
            height: 75,
            widget: hotspotButton(text: "A320 Produktion", icon: Icons.airplanemode_active, onPressed: () {}),
          )
        ],
      ),
    );
  }
    /*return Scaffold(
      bottomNavigationBar: bottomNavBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: greenSuccess,
        child: Text('save', style: TextStyle(fontSize: 20),),
        onPressed: (){},
      ),
    );
  }*/
}