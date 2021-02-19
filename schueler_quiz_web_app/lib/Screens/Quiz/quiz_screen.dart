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
import 'package:schueler_quiz_web_app/Screens/afterRare.dart';
import 'package:schueler_quiz_web_app/Screens/ende.dart';
import 'package:schueler_quiz_web_app/constants.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentLevel =
      0; //if the user is on first second or third panorama(/difficulty)
  int selectedIndex = 0;
  int tipsLeft = 4;
  bool show360 = true; //if true displays the panorama, else a question
  bool noTimeLeft = false;
  bool showEasyDone = false;
  bool showMediumDone = false;
  bool showHardDone = false;

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
          if (showEasyDone == false &&
              showHardDone == false &&
              showMediumDone == false) {
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
          }
        },
      ),
    );
  }

  List answers = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  onItemClicked(int index) {
    setState(() {
      //print("lon:" + _lon.toString() + " lat: " + _lat.toString());
      lastLon = _lon;
      lastLat = _lat;
      show360 = false;
      selectedIndex = index;
      if (answers[selectedIndex] == '') {
        answerController.clear();
      } else {
        answerController.text = answers[selectedIndex];
      }
      //tiptaken = false;
    });
  }

  List tiptaken = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  List richtige = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  List correctAnswers = [
    '22',
    '',
    '1',
    '5,3,2,9,7,6,4,1,8,5',
    'rmulinzgrp',
    '',
    '',
    '1112213211',
    '0.25'
  ];

  List tips = [
    'überlege dir zuerst wie viele A320 an einem Tag produziert werden können, dann wie viele Triebwerke pro Tag übrig bleiben',
    'tip2',
    'Kabel 1 endet bei 5, Kabel 2 endet bei 2 und Kabel 3 endet bei 4',
    'Der Anfang ist 5, 3, 2, 9, 7, ',
    'Die Wörter airbus und zriyfh gehören zusammen',
    'tip2',
    'tip2',
    'tip2',
    'tip2',
  ];

  List answerSize = [100, 0, 100, 500, 400, 0, 600, 300, 100];

  List quizPunkte = [3, 4, 6, 7, 3, 2, 4, 3, 7];

  bool checkAnswers() {
    if (currentLevel == 0) {
      if (correctAnswers[0] == answers[0] &&
          correctAnswers[1] == answers[1] &&
          correctAnswers[2] == answers[2] &&
          correctAnswers[3] == answers[3] &&
          correctAnswers[4] == answers[4]) {
        return true;
      }
    } else if (currentLevel == 1) {
      if (correctAnswers[5] == answers[5] && correctAnswers[6] == answers[6]) {
        return true;
      }
    } else {
      if (correctAnswers[7] == answers[7] && correctAnswers[8] == answers[8]) {
        return true;
      }
    }
    return false;
  }

  Widget answer(double width) {
    return AnimatedContainer(
      curve: Curves.easeOutQuad,
      duration: Duration(milliseconds: 1500),
      width: width,
      child: Visibility(
        visible: width == 0 ? false : true,
        child: TextField(
          style: Theme.of(context).textTheme.bodyText1,
          controller: answerController,
          decoration: InputDecoration(
              hintText: 'Antwort',
              hintStyle: TextStyle(color: Colors.white70),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: secondaryBlue, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryBlue, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              suffixIcon: IconButton(
                color: greenSuccess,
                icon: Icon(Icons.check),
                onPressed: () {
                  setState(() {
                    answers[selectedIndex] = answerController.text;
                    show360 = true;
                    if (checkAnswers()) {
                      currentLevel++;
                      if (currentLevel == 1) {
                        showEasyDone = true;
                      }
                      //Navigator.push(context, MaterialPageRoute(builder: (context) {return easyDone();}));
                      //if (currentLevel == 2)
                      //Navigator.push(context, MaterialPageRoute(builder: (context) {return ();}));
                      //if (currentLevel == 3)
                      //Navigator.push(context, MaterialPageRoute(builder: (context) {return easyDone();}));
                    } //geht aufs nächste Panorama, wenn alle Antworten richtig sind
                  });
                },
              )),
          onSubmitted: (String s) {
            answers[selectedIndex] = s;
          },
        ),
      ),
    );
  }

  Widget hotspotButton(
      {String text, IconData icon, VoidCallback onPressed, Color color}) {
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
          child: Icon(
            icon,
            color: color,
          ),
          onPressed: onPressed,
        ),
        text != null
            ? Container(
                padding: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Center(
                    child:
                        Text(text, style: TextStyle(color: Colors.white))), //
              )
            : Container(),
      ],
    );
  }

  Widget topBar(bool onlyTime) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: onlyTime ? Colors.white54 : Colors.grey[200],
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!onlyTime)
                    Text("Punkte: " + quizPunkte[selectedIndex].toString()),
                  if (!onlyTime) SizedBox(width: 20),
                  if (seconds > 9 && minutes > 9)
                    Text(minutes.toString() + ':' + seconds.toString()),
                  if (seconds < 10 && minutes > 9)
                    Text(minutes.toString() + ':' + '0' + seconds.toString()),
                  if (seconds > 9 && minutes < 10)
                    Text('0' + minutes.toString() + ':' + seconds.toString()),
                  if (seconds < 10 && minutes < 10)
                    Text('0' +
                        minutes.toString() +
                        ':' +
                        '0' +
                        seconds.toString()),
                  if (!onlyTime) SizedBox(width: 20),
                  if (!onlyTime)
                    TextButton(
                        onPressed: () {
                          setState(() {
                            if (tipsLeft > 0 &&
                                tiptaken[selectedIndex] == false) {
                              tipsLeft--;
                              tiptaken[selectedIndex] = true;
                            }
                          });
                        },
                        child: Text("Tip (" + tipsLeft.toString() + " übrig)")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size; //height and width of the screen

    if (noTimeLeft == true) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Ende();
      }));
    }

    List quizWidgets = [
      question1(context),
      question2(context),
      question3(context),
      question4(context),
      question5(context),
      question6(context),
      question7(context),
      question8(context),
      question9(context),
    ];

    Widget questionScreen() {
      return Stack(children: [
        Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            topBar(show360),
            tiptaken[selectedIndex]
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Tip: " + tips[selectedIndex],
                      style: TextStyle(fontSize: 16, color: Colors.orange),
                    ),
                  )
                : SizedBox(
                    height: 39,
                  ),
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
        Container(
          child: Image.asset('assets/images/AIRBUS_White.png'),
          height: 60,
        ),
      ]);
    }

    //print("lon:" + lastLon.toString() + " lat: " + lastLat.toString());
    Widget panorama;
    switch (currentLevel) {
      case 1:
        panorama = Panorama(
          child: Image.asset('assets/images/a.jpeg'),
          onViewChanged: onViewChanged,
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          hotspots: [
            Hotspot(
              latitude: -35.7054290,
              longitude: 114.01527664,
              width: 80,
              height: 80,
              widget: hotspotButton(
                text: "Sortieren",
                icon: Icons.code,
                onPressed: () {
                  setState(() {
                    onItemClicked(5);
                  });
                },
                color: (correctAnswers[5] == answers[5])
                    ? greenSuccess
                    : Colors.blue,
              ),
            ),
            Hotspot(
              latitude: -1.5,
              longitude: 55.47,
              width: 80,
              height: 80,
              widget: hotspotButton(
                text: "Transportbänder",
                icon: Icons.transfer_within_a_station,
                onPressed: () {
                  setState(() {
                    onItemClicked(6);
                  });
                },
                color: (correctAnswers[6] == answers[6])
                    ? greenSuccess
                    : secondaryBlue,
              ),
            ),
          ],
        );
        break;
      default:
        panorama = Panorama(
          child: Image.asset('assets/images/a.jpeg'),
          onViewChanged: onViewChanged,
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          hotspots: [
            Hotspot(
              latitude: -35.7054290,
              longitude: 114.01527664,
              width: 80,
              height: 80,
              widget: hotspotButton(
                text: "A320 Produktion",
                icon: Icons.airplanemode_active,
                onPressed: () {
                  setState(() {
                    onItemClicked(0);
                  });
                },
                color: (correctAnswers[0] == answers[0])
                    ? greenSuccess
                    : secondaryBlue,
              ),
            ),
            Hotspot(
              latitude: -1.5,
              longitude: 55.47,
              width: 80,
              height: 80,
              widget: hotspotButton(
                text: "Produktionsplan",
                icon: Icons.grid_on,
                onPressed: () {
                  setState(() {
                    onItemClicked(1);
                  });
                },
                color: (correctAnswers[1] == answers[1])
                    ? greenSuccess
                    : secondaryBlue,
              ),
            ),
            Hotspot(
              latitude: 20,
              longitude: 80,
              width: 80,
              height: 80,
              widget: hotspotButton(
                text: "Kabelgewirr",
                icon: Icons.alt_route,
                onPressed: () {
                  setState(() {
                    onItemClicked(2);
                  });
                },
                color: (correctAnswers[2] == answers[2])
                    ? greenSuccess
                    : secondaryBlue,
              ),
            ),
            Hotspot(
              latitude: 0,
              longitude: 0,
              width: 80,
              height: 80,
              widget: hotspotButton(
                text: "Flugplan",
                icon: Icons.cases,
                onPressed: () {
                  setState(() {
                    onItemClicked(3);
                  });
                },
                color: (correctAnswers[3] == answers[3])
                    ? greenSuccess
                    : secondaryBlue,
              ),
            ),
            Hotspot(
              latitude: -14,
              longitude: -100,
              width: 80,
              height: 80,
              widget: hotspotButton(
                text: "Verschlüsselung",
                icon: Icons.no_encryption,
                onPressed: () {
                  setState(() {
                    onItemClicked(4);
                  });
                },
                color: (correctAnswers[4] == answers[4])
                    ? greenSuccess
                    : secondaryBlue,
              ),
            ),
            Hotspot(
              latitude: 0,
              longitude: -20,
              width: 80,
              height: 80,
              widget: hotspotButton(
                text: "Sequence",
                icon: Icons.no_encryption,
                onPressed: () {
                  setState(() {
                    onItemClicked(7);
                  });
                },
                color: (correctAnswers[7] == answers[7])
                    ? greenSuccess
                    : secondaryBlue,
              ),
            ),
          ],
        );
    }

    return Scaffold(
      body: Stack(
        children: [
          panorama,
          Text(
              '${_lon.toStringAsFixed(3)}, ${_lat.toStringAsFixed(3)}, ${_tilt.toStringAsFixed(3)}'),
          topBar(show360),
          Container(
              child: Image.asset('assets/images/airbusblue.png'), height: 60),
          show360
              ? SizedBox(height: 0)
              : Center(
                  child: Container(
                    //height: size.height - 50,
                    //width: size.width - 50,
                    child: questionScreen(),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.black, primaryBlue],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)),
                  ),
                ),
          if (showEasyDone) easyDone(context),
        ],
      ),
      floatingActionButton: !show360
          ? FloatingActionButton(
              child: Icon(Icons.check),
              backgroundColor: greenSuccess,
              onPressed: () {
                setState(() {
                  answers[selectedIndex] = answerController.text;
                  show360 = true;
                  if (checkAnswers()) {
                    currentLevel++;
                    if (currentLevel == 1) {
                      showEasyDone = true;
                    }
                    //Navigator.push(context, MaterialPageRoute(builder: (context) {return easyDone();}));
                    //if (currentLevel == 2)
                    //Navigator.push(context, MaterialPageRoute(builder: (context) {return ();}));
                    //if (currentLevel == 3)
                    //Navigator.push(context, MaterialPageRoute(builder: (context) {return easyDone();}));
                  } //geht aufs nächste Panorama, wenn alle Antworten richtig sind
                });
              },
            )
          : SizedBox(height: 0),
    );
  }
}
