import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:schueler_quiz_web_app/Screens/Quiz/question1.dart';

Widget question4(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(100, 0, 100, 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 3,
            child: Container(
            constraints: BoxConstraints(maxWidth: 1000),
            child: Text("In folgendem Bild sind 9 Flughäfen. Unter jedem Flughafen steht ein Ziel und ein Gewicht einer Fracht. Ein Frachtflugzeug startet bei Flughafen 5 und soll am Ende dort auch wieder landen. Es soll alle Frachten zu den jeweiligen Orten bringen. Das Flugzeug kann maximal 60 Tonnen transportieren. Finde die Route, bei der das Frachtflugzeug auf jedem Flugplatz nur einmal landet und das niedrigste Durchschnittsgewicht insgesamt transportieren muss.",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
        /*Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [airport(1, 5, 20, context), airport(2, 7, 20, context), airport(3, 6, 5, context)],),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [airport(4, 5, 10, context), airport(5, 0, 0, context), airport(6, 4, 40, context)],),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [airport(7, 4, 20, context), airport(8, 5, 30, context), airport(9, 7, 30, context)],),
          ],
        ),*/
        Flexible(flex: 10, child: Image(image: AssetImage("assets/images/Aufgabe_4_Ver_4_Weiss.png"),)),
        Flexible(
          flex: 1,
            child: Text('Gebe die Reihenfolge der Flugplätze an. Eine mögliche Eingabe wäre z.B. 5, 6, 1, 8, 3, 9, 2, 4, 7, 5',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        //answer(500),
      ],
    ),
  );
}

Widget airport (int number, int to, int weight, BuildContext context) {
  if(to == 0 && weight == 0) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(number.toString(), style: Theme.of(context).textTheme.bodyText1,),
      ),
      decoration: BoxDecoration(
        color: Colors.black26,
        shape: BoxShape.circle,
      ),
    );
  }
  return Container(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        number.toString() + "\n->" + to.toString() + '\n' + weight.toString() + 't',
        style: Theme.of(context).textTheme.bodyText1,
        ),
    ),
  );
}