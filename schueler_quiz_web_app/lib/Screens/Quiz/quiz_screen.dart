import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:panorama/panorama.dart';
//import 'package:video_player/video_player.dart';

import 'package:schueler_quiz_web_app/Screens/Quiz/question1.dart';
import 'package:schueler_quiz_web_app/Screens/Quiz/question2.dart';
import 'package:schueler_quiz_web_app/Screens/Quiz/question3.dart';
import 'package:schueler_quiz_web_app/Screens/Quiz/question4.dart';
import 'package:schueler_quiz_web_app/Screens/Quiz/question5.dart';
import 'package:schueler_quiz_web_app/Screens/Quiz/question6.dart';
//import 'package:schueler_quiz_web_app/Screens/Quiz/question7.dart';
import 'package:schueler_quiz_web_app/Screens/Quiz/question8.dart';
import 'package:schueler_quiz_web_app/Screens/Quiz/question9.dart';
import 'package:schueler_quiz_web_app/Screens/afterMedium.dart';
import 'package:schueler_quiz_web_app/Screens/afterRare.dart';
import 'package:schueler_quiz_web_app/Screens/ende.dart';
import 'package:schueler_quiz_web_app/constants.dart';

class PseudoCode {
  String id;
  String title;
  Color color;

  PseudoCode({
    @required this.id,
    @required this.title,
    @required this.color,
  });
}

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
  bool isLoading = true;
  bool isLoadingFirst = true;
  int beantwortet = 0;

  double _lon = 0;
  double _lat = 0;
  //double _tilt = 0;
  double lastLon = 0;
  double lastLat = 0;
  double punktzahl = 0;

  void onViewChanged(longitude, latitude, tilt) {
    setState(() {
      _lon = longitude;
      _lat = latitude;
      //_tilt = tilt;
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

  List questionsPerLevel = [4, 3, 2];

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
    if (!isLoading && !richtigBeantwortet[index]) {
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
    }
    if(richtigBeantwortet[index]){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Bereits richtig beantwortet"),
        backgroundColor: greenSuccess,)
      );
    }
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
    ['22'],
    ['149162536496481100'],
    ['1'],
    ['5329764185'],
    ['rmulinzgrp'],
    ['1236874159', '1478632159'],
    ['10496312118715132'],
    ['1112213211'],
    ['183', '184', '185', '186', '187', '188'],
  ];

  List tips = [
    'überlege dir zuerst wie viele A320 an einem Tag produziert werden können, dann wie viele Triebwerke pro Tag übrig bleiben',
    'Betrachte die Teiler der Zahlen 1-100',
    'Kabel A endet bei 5, Kabel B endet bei 2 und Kabel C endet bei 4',
    'Der Anfang ist: 5; 3; 2; 9;',
    'Die Wörter "airbus" und "zriyfh" gehören zusammen',
    'Die Ecken der Linien können überall liegen',
    'Es handelt sich um selection sort und die ersten Elemente sind: 10; 4; 9; 6; 3',
    'Um dieses Rätsel zu lösen musst du nur bis 3 zählen können',
    'Es wird an zwei Stellen auf der Strecke von dem Hubschrauber in ein Auto umgeladen',
  ];

  List answerSize = [100, 500, 100, 500, 400, 200, 600, 300, 100];

  int maxTries = 3;

  Color borderColor = primaryBlue;

  List tries = [0, 0, 0, 0, 0, 0, 0, 0, 0];

  List quizPunkte = [9, 14, 7, 10, 8, 11, 13, 12, 15];

  List richtigBeantwortet = [
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

  bool checkAnswers() {
    if (currentLevel == 0) {
      if (correctAnswers[0][0] == answers[0] &&
          correctAnswers[2][0] == answers[2] &&
          correctAnswers[3][0] == answers[3] &&
          correctAnswers[4][0] == answers[4]) {
        return true;
      }
    } else if (currentLevel == 1) {
      if ((correctAnswers[5][0] == answers[5] ||
              correctAnswers[5][1] == answers[5]) &&
          correctAnswers[6][0] == answers[6] &&
          correctAnswers[7][0] == answers[7]) {
        return true;
      }
    } else {
      if (correctAnswers[1][0] == answers[1] &&
          correctAnswers[8][0] == answers[8]) {
        return true;
      }
    }
    return false;
  }

  void updatePunktzahl() {
    //überprüft die Eingabe, wenn auf den grünen haken gedrückt wurde
    if (!richtigBeantwortet[selectedIndex]) {
      //nur wenn die Frage noch nicht richtig beantwortet wurde
      double oldPunktzahl = punktzahl;
      for (int i = 0; i < correctAnswers[selectedIndex].length; i++) {
        //alle möglichen richtigen Antworten werden mit der Eingabe vergliichen
        if (correctAnswers[selectedIndex][i] == answers[selectedIndex]) {
          borderColor = greenSuccess;
          richtigBeantwortet[selectedIndex] = true;
          if (tiptaken[selectedIndex]) {
            punktzahl += 0.5 * quizPunkte[selectedIndex]; //wenn ein Tip benutzt wurde gibt es nur die Hälfte der Punkte
          } else {
            punktzahl += quizPunkte[
                selectedIndex]; //ansonsten werden die gesamten Punkte draufaddiert
          }
          break;
        }
      }
      print(punktzahl);
      if (oldPunktzahl == punktzahl) {
        borderColor = redDanger;
        // wenn die Eingabe falsch ist werden die möglichen Punkte um 1 verringert
        quizPunkte[selectedIndex]--;
        tries[selectedIndex]++;
      }
      if (tries[selectedIndex] >= maxTries) {
        richtigBeantwortet[selectedIndex] = true;
        //punktzahl wird nicht erhöht!
      }
    }
  }

  Widget answer(double width) {
    return AnimatedContainer(
      curve: Curves.easeOutQuad,
      duration: Duration(milliseconds: 1500),
      width: width,
      child: Visibility(
        visible: width == 0 ? false : true,
        child: TextField(
          autocorrect: false,
          readOnly: selectedIndex == 6 ? true : false,
          style: Theme.of(context).textTheme.bodyText1,
          controller: answerController,
          decoration: InputDecoration(
            //errorText: showError? '' : null,
            //errorStyle: TextStyle(fontSize: 0),
            hintText: 'Antwort',
            hintStyle: TextStyle(color: Colors.white70),
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: secondaryBlue, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: secondaryBlue, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
            ),
            suffixIcon: Tooltip(
              decoration: BoxDecoration(
                  color: primaryBlue,
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              message: 'Eingabe überprüfen und speichern',
              child: IconButton(
                color: greenSuccess,
                icon: Icon(Icons.check),
                onPressed: () {
                  setState(() {
                    if (answers[selectedIndex] == '' &&
                        answerController.text != '')
                      beantwortet++; //beantwortet wird ehöht falls vorher keine Antwort da war und jetzt schon
                    if (answers[selectedIndex] != '' &&
                        answerController.text == '')
                      beantwortet--; //beantwortet wird verringert falls vorher eine Antwort da war und jetzt keine
                    if (selectedIndex != 4) {
                      answers[selectedIndex] = answerController.text
                          .replaceAll(new RegExp(r'[^0-9]'), '');
                    } else {
                      answers[selectedIndex] = answerController.text;
                    }
                    updatePunktzahl();
                    //if(richtigBeantwortet[selectedIndex]){
                    //  show360 = true;
                    //}
                    if (checkAnswers()) {
                      // wenn die gesamte Stufe richtig ist
                      isLoading = true;
                      beantwortet = 0;
                      currentLevel++;
                      if (currentLevel == 1) {
                        showEasyDone = true;
                      }
                      if (currentLevel == 2) {
                        showMediumDone = true;
                      }
                      if (currentLevel == 3) {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return Ende(punktzahl);
                        }));
                      }
                    } //geht aufs nächste Panorama, wenn alle Antworten richtig sind
                  });
                },
              ),
            )
          ),
          onSubmitted: (String s) {
            answers[selectedIndex] = s;
          },
          onChanged: (String s) {
            setState(() {
              borderColor = primaryBlue;
            });   
            /*if(selectedIndex == 7){
              List newOrder = s.split('; ');
              for(int i=0; i<items.length; i++){
                print(newOrder[i] + ' ');
              }
              //reorderData(oldindex, newindex)
            }*/
          },
        ),
      ),
    );
  }

  Widget hotspotButton({String text, String image, VoidCallback onPressed}) {
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
        Tooltip(
          textStyle: Theme.of(context).textTheme.bodyText1,
          margin: EdgeInsets.all(4.0),
          decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.all(Radius.circular(4))),
          message: text,
          child: TextButton(
            style: TextButton.styleFrom(
              shape: CircleBorder(),
              backgroundColor: Colors.black38,
            ),
            child: Image.asset(image, height: 30, width: 30),
            onPressed: onPressed,
          ),
        ),
        /*text != null
            ? Container(
                padding: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Center(
                    child:
                        Text(text, style: TextStyle(color: Colors.white))), //
              )
            : Container(),*/
      ],
    );
  }

  Widget topBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: show360 ? Colors.white54 : Colors.grey[200],
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            //width: MediaQuery.of(context).size.width,
            //height: 55,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  show360
                      ? Tooltip(
                          decoration: BoxDecoration(
                              color: primaryBlue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          message:
                              'Jedes Level nimmt an Schwierigkeit zu, aber an Anzahl der Fragen ab.',
                          child: Text(
                              "Level: " + (currentLevel + 1).toString() + "/3"))
                      : Text("Punkte: " + quizPunkte[selectedIndex].toString()),
                  SizedBox(width: 20),
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
                  SizedBox(width: 20),
                  show360
                      ? Tooltip(
                          decoration: BoxDecoration(
                              color: primaryBlue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          message:
                              'Anzahl an Fragen in dieser Stufe die du bereits beantwortet hast ',
                          child: Text('beantwortet: ' +
                              beantwortet.toString() +
                              '/' +
                              questionsPerLevel[currentLevel].toString()),
                        )
                      : TextButton(
                          onPressed: () {
                            setState(() {
                              if (tipsLeft > 0 &&
                                  tiptaken[selectedIndex] == false) {
                                tipsLeft--;
                                tiptaken[selectedIndex] = true;
                              }
                            });
                          },
                          child:
                              Text("Tip (" + tipsLeft.toString() + " übrig)")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<PseudoCode> items = [
    PseudoCode(
        id: '4',
        title:
            'solange i kleiner als die Länge der Liste ist, wird i um 1 erhöht und folgendes ausgeführt: {',
        color: highlightColor2),
    PseudoCode(id: '2', title: '}', color: highlightColor2),
    PseudoCode(
        id: '6',
        title:
            'Es sei j eine Variable, in die der aktuelle Wert von i+1 gespeichert wird',
        color: highlightColor4),
    PseudoCode(
        id: '9',
        title:
            'Es sei min eine Variable, in die der aktuelle Wert von i gespeichert wird',
        color: Colors.deepOrange[400]),
    PseudoCode(
        id: '1',
        title: 'Falls der Wert von min nicht der gleiche ist, wie der von i: {',
        color: highlightColor3),
    PseudoCode(id: '13', title: '}', color: highlightColor3),
    PseudoCode(
        id: '3',
        title:
            'solange j kleiner als die Länge der Liste ist, wird j um 1 erhöht und folgendes ausgeführt: {',
        color: highlightColor5),
    PseudoCode(id: '7', title: '}', color: highlightColor5),
    PseudoCode(
        id: '12',
        title:
            'Falls der Eintrag der Liste an der Stelle j kleiner ist als der Eintrag an der Stelle min, dann: {',
        color: highlightColor6),
    PseudoCode(id: '8', title: '}', color: highlightColor6),
    PseudoCode(
        id: '10',
        title: 'Es sei i eine Variable, die ganze Zahlen speichert',
        color: highlightColor1),
    PseudoCode(
        id: '5',
        title:
            'tausche das Listenelement an der Stelle i mit dem an der Stelle min',
        color: highlightColor4),
    PseudoCode(
        id: '11',
        title: 'weise der Variable min den aktuellen Wert von j zu',
        color: highlightColor7),
  ];

  Widget pseudoCodeTile(PseudoCode pseudoCode) {
    return Card(
      color: pseudoCode.color,
      key: Key(pseudoCode.id),
      elevation: 12,
      child: ListTile(
        leading: Text(
          pseudoCode.id,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        title: Text(
          pseudoCode.title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }

  void reorderData(int oldindex, int newindex) {
    setState(() {
      if (newindex > oldindex) {
        newindex -= 1;
      }
      final item = items.removeAt(oldindex);
      items.insert(newindex, item);
      String selectedOrder = '';
      for (int i = 0; i < items.length; i++) {
        selectedOrder += items[i].id;
        if (i != (items.length - 1)) {
          selectedOrder += '; ';
        }
      }
      answerController.text = selectedOrder;
    });
  }

  Widget question7(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(100, 0, 100, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                'Bringe den folgenden Code in die richtige Reihenfolge, damit eine Liste in aufsteigender Reihenfolge sortiert wird. Nutze dazu die zwei Striche am rechten Rand.',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
          Flexible(
            flex: 8,
            child: Container(
              constraints: BoxConstraints(maxWidth: 1000),
              child: ReorderableListView(
                children: items.map((pseudoCode) {
                  return pseudoCodeTile(pseudoCode);
                }).toList(),
                onReorder: reorderData,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              'HINWEIS: Zusammengehörige "{" und "}" haben die gleiche Farbe und müssen entsprechend sortiert werden',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );
  }

  Widget zwischenInfos(Widget widget, int nr) {
    return Stack(alignment: AlignmentDirectional.bottomCenter, children: [
      widget,
      Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: TextButton(
          style: TextButton.styleFrom(backgroundColor: greenSuccess),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Weiter',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          onPressed: () {
            setState(() {
              isLoading = false;
              if (nr == 0) showEasyDone = !showEasyDone;
              if (nr == 1) showMediumDone = !showMediumDone;
              if (nr == 2) showHardDone = !showHardDone;
            });
          },
        ),
      ),
    ]);
  }

  Widget startTimerWidget() {
    return Center(
      child: Container(
          padding: EdgeInsets.all(15),
          height: 140,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.black87,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  'Bitte klicke auf den Button, sobald das 360° Bild geladen ist, um die Zeit zu starten:',
                  style: Theme.of(context).textTheme.bodyText1),
              TextButton(
                child: Text(
                  'Timer starten',
                  style: TextStyle(color: secondaryBlue),
                ),
                onPressed: () {
                  setState(() {
                    startTimer();
                    isLoading = false;
                    isLoadingFirst = false;
                  });
                },
              )
            ],
          )),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size; //height and width of the screen

    if (noTimeLeft) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Ende(punktzahl);
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
            topBar(),
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
          minZoom: 1.0,
          maxZoom: 1.0,
          child: Image.asset('assets/images/eurofighter.jpg'),
          onViewChanged: onViewChanged,
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          hotspots: [
            Hotspot(
              latitude: 3.4,
              longitude: 126.7,
              width: 80,
              height: 80,
              widget: hotspotButton(
                text: "Sortieralgorithmus",
                image: "assets/images/SortierenIcon.png",
                onPressed: () {
                  setState(() {
                    onItemClicked(6);
                  });
                },
              ),
            ),
            Hotspot(
              latitude: 90,
              longitude: 0,
              width: 80,
              height: 80,
              widget: hotspotButton(
                text: "Sequenz",
                image: "assets/images/SequenceIcon.png",
                onPressed: () {
                  setState(() {
                    onItemClicked(7);
                  });
                },
              ),
            ),
            Hotspot(
              latitude: -4.12,
              longitude: 15.47,
              width: 80,
              height: 80,
              widget: hotspotButton(
                text: "Transportbänder",
                image: "assets/images/TransportbänderIcon.png",
                onPressed: () {
                  setState(() {
                    onItemClicked(5);
                  });
                },
              ),
            ),
          ],
        );
        break;
      case 2:
        panorama = Panorama(
          minZoom: 1.0,
          maxZoom: 1.0,
          child: Image.asset(
            'assets/images/helicopter.jpg',
          ),
          onViewChanged: onViewChanged,
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          hotspots: [
            Hotspot(
              latitude: -2.98,
              longitude: -63.5,
              width: 80,
              height: 80,
              widget: hotspotButton(
                text: "Pseudocode",
                image: "assets/images/PseudocodeIcon.png",
                onPressed: () {
                  setState(() {
                    onItemClicked(1);
                  });
                },
              ),
            ),
            Hotspot(
              latitude: -8,
              longitude: 57.4,
              width: 80,
              height: 80,
              widget: hotspotButton(
                text: "Bluttransport",
                image: "assets/images/TransportIcon.png",
                onPressed: () {
                  setState(() {
                    onItemClicked(8);
                  });
                },
              ),
            ),
          ],
        );
        break;
      default:
        panorama = Panorama(
          sensitivity: 1.5,
          //zoom: 1.2,
          minZoom: 1.0,
          maxZoom: 1.0,
          //minLongitude: -135,
          //maxLongitude: 135,
          //minLatitude: -30,
          //maxLatitude: 30,
          child: Image.asset(
            'assets/images/a340Cockpit.jpg',
          ),
          onViewChanged: onViewChanged,
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          hotspots: [
            Hotspot(
              latitude: -3.5,
              longitude: 44.5,
              width: 80,
              height: 80,
              widget: hotspotButton(
                text: "A320 Produktion",
                image: "assets/images/A320Icon.png",
                onPressed: () {
                  setState(() {
                    onItemClicked(0);
                  });
                },
              ),
            ),
            Hotspot(
              latitude: -29.7,
              longitude: -177.1,
              width: 80,
              height: 80,
              widget: hotspotButton(
                text: "Kabelgewirr",
                image: "assets/images/KabelgewirrIcon.png",
                onPressed: () {
                  setState(() {
                    onItemClicked(2);
                  });
                },
              ),
            ),
            Hotspot(
              latitude: -12.9,
              longitude: -77.4,
              width: 80,
              height: 80,
              widget: hotspotButton(
                text: "Flugplan",
                image: "assets/images/FlugplanIcon.png",
                onPressed: () {
                  setState(() {
                    onItemClicked(3);
                  });
                },
              ),
            ),
            Hotspot(
              latitude: -57.6,
              longitude: -5.4,
              width: 80,
              height: 80,
              widget: hotspotButton(
                text: "Verschlüsselung",
                image: "assets/images/VerschlüsselungIcon.png",
                onPressed: () {
                  setState(() {
                    onItemClicked(4);
                  });
                },
              ),
            ),
          ],
        );
    }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: Stack(
        children: [
          panorama,
          if (isLoadingFirst) startTimerWidget(),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  '© Airbus - Schwarzbild Medienproduktion - Kevin Müller',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
              color: Colors.black45,
            ),
          ),
          //Text('${_lon.toStringAsFixed(3)}, ${_lat.toStringAsFixed(3)}, ${_tilt.toStringAsFixed(3)}'),
          topBar(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 28),
            child: Container(
              color: mainBlue,
              height: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 28),
            child: Container(
              color: mainBlue,
              height: 6,
              width: 140,
            ),
          ),
          Container(
              child: Image.asset('assets/images/airbusblue.png'), height: 70),
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
          if (showEasyDone) zwischenInfos(easyDone(context), 0),
          if (showMediumDone) zwischenInfos(mediumDone(context), 1),
        ],
      ),
      floatingActionButton: !show360
          ?
          /*FloatingActionButton(
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
        )*/
          Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Tooltip(
                decoration: BoxDecoration(
                    color: primaryBlue,
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: TextButton.icon(
                  onPressed: () {
                    setState(() {
                      show360 = true;
                      answerController.text = '';
                      borderColor = primaryBlue;
                    });
                  },
                  icon: Icon(Icons.arrow_back),
                  label: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Zurück',
                      style: TextStyle(color: primaryBlue),
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.yellow,
                  ),
                ),
                message: 'zurück zum 360° Bild ohne die Eingabe zu speichern',
              ),
            )
          : SizedBox(height: 0),
    );
  }
}
