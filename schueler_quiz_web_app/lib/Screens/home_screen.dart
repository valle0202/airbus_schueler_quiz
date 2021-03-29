import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:schueler_quiz_web_app/Screens/Quiz/quiz_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:schueler_quiz_web_app/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  dynamic data;
  bool loginComplete = false;
  double x = 0.0;
  double y = 0.0;
  bool defaultPosition = true;
  double buttonWidth = 420.0;
  double buttonHeight = 140.0;
  String personalPassword = '';

  DocumentSnapshot snapshot;

/*
* importiert Passwörter aus Firestore 
*/
  void getData() async {
    final data = await FirebaseFirestore.instance
        .collection('passwords')
        .doc('nBmyPDh14CSmUMWKHD0k')
        .get();
    snapshot = data;
  }

/*
* erstellt Login Feld und überprüft Passwort 
*/
  Widget loginField() {
    return Center(
      child: Container(
        width: 400,
        height: 60,
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            hintText: 'persönliches Passwort',
            fillColor: Colors.white60,
            filled: true,
            suffixIcon: Tooltip(
                message:
                    'Dein persönliches Passwort findest du in deinem \nPaket und auf der Anmeldeseite.',
                preferBelow: false,
                verticalOffset: 15,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: primaryBlue,
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: IconButton(
                  icon: Icon(Icons.info),
                  onPressed: () {},
                  mouseCursor: SystemMouseCursors.click,
                )),
          ),
          onChanged: (String value) {
            if (value.length > 5) {
              for (int i = 0; i < snapshot.data().length; i++) {
                if (snapshot.data()[(i + 1).toString()] == value) {
                  setState(() {
                    personalPassword = value;
                    loginComplete = true;
                  });
                }
              }
            }
          },
          //onSubmitted: , Fehlermeldung
        ),
      ),
    );
  }

/*
* führt getData() aus 
*/
  @override
  void initState() {
    super.initState();
    getData();
  }

/*
* erstellt startbutton, Regelfeld, Tippfeld
*/
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //height and width of the screen

    double percentageX = (x / size.width) * 100;
    double percentageY = (y / size.height) * 100;

    Widget startButton() {
      return Column(
        children: [
          SizedBox(height: size.height / 2 - 70),
          Center(
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(
                    defaultPosition ? 0 : (0.3 * (percentageY / 50) - 0.3))
                ..rotateY(
                    defaultPosition ? 0 : (-0.3 * (percentageX / 50) + 0.3)),
              alignment: FractionalOffset.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white70,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  elevation: 5.0,
                  fixedSize: Size(buttonWidth, buttonHeight),
                ),
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(
                        defaultPosition ? 0.0 : (30 * (percentageX / 50) + -30),
                        defaultPosition ? 0.0 : (22 * (percentageY / 50) + -22),
                        0.0),
                  alignment: FractionalOffset.center,
                  child: Text(
                    'START THE \n      CHALLENGE!',
                    style: TextStyle(
                      color: Colors.blueGrey[900],
                      fontSize: 45,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return QuizScreen(personalPassword);
                  }));
                },
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Flexible(
                flex: 2,
                child: Container(),
              ),
              Flexible(
                flex: 20,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text(
                    'Regeln: \n - Das Quiz ist eine Stunde lang und besteht aus drei Schwierigkeitssstufen, die auf drei 360° Bilder aufgeteilt sind, mit jeweils vier, drei und zwei Fragen. \n - Jede Frage kann dreimal beatwortet werden bevor sie gesperrt ist, das richtige Beantworten einer Fragen im zweiten oder dritten Versuche, erbringt jedoch einen bzw. zwei Punkte weniger als im ersten.  \n - Um die nächste Stufe zu erreichen müssen alle Fragen einer Stufe entweder richtig beatwortet oder gesperrt werden\n - Jede Frage ist ihrer Schwierigkeit entsprechend unterschiedlich stark bepunktet, insgesamt sind 100 mögliche Punkte zu erreichen\n - Ist eine Frage zu schwer liegen einem vier Tipps zur Verfügung, welche für vier beliebige Fragen eingelöst werden können, jedoch den Punkteertrag für das Lösen der jeweiligen Frage halbiert',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(),
              ),
              Flexible(
                flex: 20,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    'Tipps: \n - Lege dir Stift und Papier bereit, da du die für das Lösen mancher Fragen benötigen wirst\n - Manche Fragen sind versteckt, schaue dich auf dem gesamt 360° Bild in allen Achsenrichtungen um, um alle Fragen zu finden\n - Das Quiz ist nicht darauf ausgelegt, dass man in der Zeit alle Fragen richtig beantworten kann, scheue daher nicht davor zurück deine Tipps einzusetzen bzw. eine Frage durch sperren zu überspringen ',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(),
              ),
            ],
          ),
        ],
      );
    }

    return Scaffold(
      body: MouseRegion(
        onEnter: (_) {
          setState(() {
            defaultPosition = false;
          });
        },
        onExit: (_) {
          setState(() {
            x = size.width / 2;
            y = size.height / 2;
            defaultPosition = true;
          });
        },
        onHover: (details) {
          if (mounted) setState(() => defaultPosition = false);
          if (details.localPosition.dx > 0 && details.localPosition.dy > 0) {
            if (details.localPosition.dx < size.width &&
                details.localPosition.dy < size.height) {
              x = details.localPosition.dx;
              y = details.localPosition.dy;
            }
          }
        },
        child: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/zeroEAll.jpg"),
                      fit: BoxFit.cover)),
            ),
            loginComplete ? startButton() : loginField(),
            Container(
              child: Image.asset('assets/images/airbusblue.png'),
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
