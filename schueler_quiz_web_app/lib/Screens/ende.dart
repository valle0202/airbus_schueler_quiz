import 'package:flutter/material.dart';
import 'package:schueler_quiz_web_app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Ende extends StatefulWidget {

  final double punktzahl;
  final String personalPassword;

  Ende(this.punktzahl, this.personalPassword);

  @override
  _EndeState createState() => _EndeState();
}

class _EndeState extends State<Ende> {

  List<Color> colorList = [
    highlightColor2F,
    highlightColor3F,
    highlightColor4F,
    highlightColor5F,
    highlightColor6F,
    highlightColor7F,
    highlightColor1F,
    /*Colors.black,
    mainBlue,
    primaryBlue,
    secondaryBlue,*/
  ];
  int index = 0;
  Color bottomColor = highlightColor2F;
  Color topColor = highlightColor3F;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {bottomColor = highlightColor3F;}));
    FirebaseFirestore.instance.collection('punkte').add({widget.personalPassword : widget.punktzahl});
    super.initState();
  }

  Widget Link (String text) {
    return Text()
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Center(
          child: AnimatedContainer(
            duration: Duration(seconds: 2),
            width: size.width,
            onEnd: () {
              setState(() {
                index = index + 1;
                bottomColor = colorList[index % colorList.length];
                topColor = colorList[(index + 1) % colorList.length];
              });
            },
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [bottomColor, topColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 20),
              child: Center(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 1200),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Die Zeit ist abgelaufen vielen Dank für die Teilnahme! Du hast: ' + widget.punktzahl.toString() + ' von 100 Punkten erreicht!\n', 
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        'Glückwunsch! Damit hast du dir eine Eintrittskarte für das kommende Event erspielt:', 
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 60.0),
                        child: Text('//hier Grafik von Ticket einfügen'),
                      ),
                      /*Text(
                        'Hier kannst du dich weiter über ein Duales Studium oder eine Ausbildung bei Airbus informieren:', 
                        style: Theme.of(context).textTheme.bodyText1,
                      ),*/
                      Text(
                        'Diese Website wurde von den Dualen Studenten Leander Fritsch und David Masloub in einem ihrer Praxiseinsätze erstellt. \n'
                        + 'Lerne mehr über die Vielfältigen Möglichkeiten bei Airbus unter den folgenden Links und am XX.XX.2021 beim LiveEvent, wir freuen uns auf Dich!', 
                        style: Theme.of(context).textTheme.bodyText1,
                      ),

                    ],
                  ),
                ),
              ),
            )
          )
        ),
        Center(child: Image.asset("assets/images/Airbus_CarbonGridAusschnitt.png", scale: 5,)),//sieht nicht gut aus :(
        ]
      ),
    );
  }
}