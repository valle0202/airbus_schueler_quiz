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

  void getData() async {
    final data =await FirebaseFirestore.instance.collection('passwords').doc('nBmyPDh14CSmUMWKHD0k').get();
    snapshot = data;
  }

  Widget loginField () {
    //var focusNode = FocusNode();
    //focusNode.requestFocus();
    return Center(
      child: Container(
        width: 400,
        height: 60,
        child: TextField(
          //focusNode: focusNode,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
            hintText: 'persönliches Passwort',
            fillColor: Colors.white60,
            filled: true,
            suffixIcon: Tooltip(message: 'Dein persönliches Passwort findest du in deinem \nPaket und auf der Anmeldeseite.',
              preferBelow: false,
              verticalOffset: 15,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(color: primaryBlue, borderRadius: BorderRadius.all(Radius.circular(4))),
              child: IconButton(icon: Icon(Icons.info), onPressed: () {}, mouseCursor: SystemMouseCursors.click,)
            ),
          ),
          onChanged: (String value) {
            if(value.length > 5) {
              for(int i=0; i < snapshot.data().length; i++){
                if (snapshot.data()[(i+1).toString()] == value) {
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

@override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    /*for(int i=0; i<acceptablePasswords.length; i++){
      print(acceptablePasswords[i]);
      print('hi');
    }*/
    
    Size size = MediaQuery.of(context).size; //height and width of the screen

    double percentageX = (x / size.width) * 100;
    double percentageY = (y / size.height) * 100;

    Widget startButton(){
      return Column(
        children: [
          SizedBox(height: size.height/2 - 70),
          Center(
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(defaultPosition ? 0 : (0.3 * (percentageY / 50) -0.3))
                ..rotateY(defaultPosition ? 0 : (-0.3 * (percentageX / 50) + 0.3)),
              alignment: FractionalOffset.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white70,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  elevation: 5.0,
                  fixedSize: Size(buttonWidth, buttonHeight),
                ),
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(defaultPosition ? 0.0 : (30 * (percentageX / 50) + -30),
                                defaultPosition ? 0.0 : (22 * (percentageY / 50) + -22), 0.0),
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
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {return QuizScreen(personalPassword);}));
                },
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.all(Radius.circular(10))),
            width: 620,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Das folgende Quiz besteht aus 3 360° Bildern mit jeweils ein par Fragen, manche davon sind ein bisschen versteckt. Du musst alle Fragen eines Levels ' + 
              'richtig beantwortet haben um in die nächste Stufe zu kommen. Nimm dir ein Stift und Papier, du wirst es für einige Fragen brauchen. Für jede Frage gibt es ' +
              'unterschiedlich viele Punkte. Insgesamt gibt es 100 Punkte. Außerdem kannst du als Hilfe immer einen deiner 4 Tips verwenden, bekommst dann aber nur die Hälfte der Punkte für die jeweilige Frage ' + 
              'Rechts unten findest du auf jeder Fragefolie einen "SKIP" button, mit dem die Frage übersprungen werden kann. Du erhälst dann aber keine Punkte für die Frage.',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: MouseRegion(
        onEnter: (_) {setState(() {
          defaultPosition = false;
        });},
        onExit: (_) {setState(() {
          x = size.width / 2;
          y = size.height / 2;
          defaultPosition = true;
        });},
        onHover: (details) {
          if (mounted) setState(() => defaultPosition = false);
          if (details.localPosition.dx > 0 && details.localPosition.dy > 0){
            if (details.localPosition.dx < size.width && details.localPosition.dy < size.height){
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
                  fit: BoxFit.cover)
                  ),
            ),
            loginComplete? startButton() : loginField(),
            Container(child: Image.asset('assets/images/airbusblue.png'), height: 100,),
          ],
        ),
      ),
    );
  }
}