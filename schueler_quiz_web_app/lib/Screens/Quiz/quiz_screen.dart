import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:panorama/panorama.dart';

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
  int tipsLeft = 4;
  bool tiptaken = false;
  bool show360 = true; //if true displays the panorama, else a question
  bool noTimeLeft = false;

  double _lon = 0;
  double _lat = 0;
  double _tilt = 0;
  double lastLon = 0;
  double lastLat = 0;


  void onViewChanged(longitude, latitude, tilt) {
    setState(() {
      _lon = longitude;
      _lat = latitude;
      _tilt = tilt;
    });
  }

  // ignore: unused_field
  Timer _timer;
  int seconds = 59;
  int minutes = 59;
  //int hours = 0;
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (seconds == 0 && minutes == 0) {
            timer.cancel();
            setState(() {
              noTimeLeft = true;
            });
          } else {
            seconds--;
            if (seconds < 0) {
              minutes--;
              seconds = 59;
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
      //print("lon:" + _lon.toString() + " lat: " + _lat.toString());
      lastLon = _lon;
      lastLat = _lat;
      show360 = false;
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
    return /*TextButton(
      style: TextButton.styleFrom(
        shape: CircleBorder(),
        backgroundColor: Colors.black38,
      ),
      child: Icon(icon),
      onPressed: onPressed,
    );*/
    
    Column(
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
                child: Center(child: Text(text, style: TextStyle(color: Colors.white))), //
              )
            : Container(),
      ],
    );
  }

  Widget questionScreen () {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [ 
        topBar(show360),
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
    );
  }

  Widget topBar (bool onlyTime) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: onlyTime? Colors.white54 : Colors.grey[200],
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if(!onlyTime) Text("Punkte: " + quizPunkte[selectedIndex].toString()),
                  if(!onlyTime) SizedBox(width:20),
                  Text(minutes.toString() + ':' + seconds.toString()),
                  if(!onlyTime) SizedBox(width:20),
                  if (!onlyTime) TextButton(
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
        ],
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
    //print("lon:" + _lon.toString() + " lat: " + _lat.toString());
    Widget panorama = Panorama(
      longitude: lastLon,
      latitude: lastLat,
      child: Image.asset('assets/images/a.jpeg'),
      onViewChanged: onViewChanged,
      onTap: (longitude, latitude, tilt) => print('onTap: $longitude, $latitude, $tilt'),
      hotspots: [
        Hotspot(
          latitude: -35.7054290,
          longitude: 114.01527664,
          width: 80,
          height: 80,
          widget: hotspotButton(text: "A320 Produktion", icon: Icons.airplanemode_active, onPressed: () {setState(() {
            onItemClicked(0);
          });}),
        ),
        Hotspot(
          latitude: -1.5,
          longitude: 55.47,
          width: 80,
          height: 80,
          widget: hotspotButton(text: "Produktionsplan", icon: Icons.grid_on, onPressed: () {setState(() {
            onItemClicked(1);
          });}),
        ),
        Hotspot(
          latitude: 80,
          longitude: 10,
          width: 80,
          height: 80,
          widget: hotspotButton(text: "Kabelgewirr", icon: Icons.alt_route, onPressed: () {setState(() {
            onItemClicked(2);
          });}),
        ),
        Hotspot(
          latitude: 0,
          longitude: 0,
          width: 80,
          height: 80,
          widget: hotspotButton(text: "Flugplan", icon: Icons.cases, onPressed: () {setState(() {
            onItemClicked(3);
          });}),
        ),
        Hotspot(
          latitude: -14,
          longitude: -100,
          width: 80,
          height: 80,
          widget: hotspotButton(text: "Verschlüsselung", icon: Icons.no_encryption, onPressed: () {setState(() {
            onItemClicked(4);
          });}),
        )
      ],
    );
  
    return Scaffold(
      body: show360? Stack(
        children: [
          show360? panorama : quizWidgets.elementAt(selectedIndex),
          Text('${_lon.toStringAsFixed(3)}, ${_lat.toStringAsFixed(3)}, ${_tilt.toStringAsFixed(3)}'),
          topBar(show360),
        ],
      ) :
      questionScreen()
      ,
      floatingActionButton: !show360? FloatingActionButton(
        child: Icon(Icons.check),
        backgroundColor: greenSuccess,
        onPressed: ()  {setState(() {
          show360 = true;
        });},
        ): SizedBox(height:0),
    );
  }
}