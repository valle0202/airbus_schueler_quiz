import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:schueler_quiz_web_app/Screens/Quiz/question1.dart';

Widget question4() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(100, 0, 100, 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("In folgendem Bild sind 9 Flughäfen. Unter jedem Flughafen steht ein Ziel und ein Gewicht einer Fracht. Ein Frachtflugzeug startet bei Flughafen 5 und soll am Ende dort auch wieder landen. Es soll alle Frachten zu den jeweiligen Orten bringen. Das Flugzeug kann maximal 60 Tonnen transportieren. Finde die Route, bei der das Frachtflugzeug auf jedem Flugplatz nur einmal landet und das niedrigste Durchschnittsgewicht insgesamt transportieren muss.",
          style: TextStyle(fontSize: 16),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [airport(1, 5, 20), airport(2, 7, 20), airport(3, 6, 5)],),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [airport(4, 5, 10), airport(5, 0, 0), airport(6, 4, 40)],),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [airport(7, 4, 20), airport(8, 5, 30), airport(9, 7, 30)],),
          ],
        ),
        Text('Gebe die Reihenfolge der Flugplätze an. Eine mögliche Eingabe wäre z.B. 5, 6, 1, 8, 3, 9, 2, 4, 7, 5'),
        //answer(500),
      ],
    ),
  );
}

Widget airport (int number, int to, int weight) {
  if(to == 0 && weight == 0) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(number.toString()),
      ),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        shape: BoxShape.circle,
      ),
    );
  }
  return Container(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        number.toString() + "\n->" + to.toString() + '\n' + weight.toString() + 't',
        style: TextStyle(fontSize: 15),
        ),
    ),
  );
}