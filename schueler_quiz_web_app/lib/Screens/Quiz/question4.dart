import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schueler_quiz_web_app/Screens/Quiz/question1.dart';
import 'package:schueler_quiz_web_app/constants.dart';

Widget question4() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("In folgendem Bild sind 9 Flughäfen. Unter jedem Flughafen steht ein Ziel und ein Gewicht einer Fracht. Ein Frachtflugzeug startet bei Flughafen 5 und soll am Ende dort auch wieder landen. Es soll alle Frachten zu den jeweiligen Orten bringen. Finde die Route, bei der das Frachtflugzeug auf jedem Flugplatz nur einmal landet und das niedrigste Durchschnittsgewicht insgesamt transportieren muss."),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Airport(1, 5, 20), Airport(2, 7, 20), Airport(3, 6, 5)],),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Airport(4, 5, 10), Airport(5, 0, 0), Airport(6, 4, 40)],),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Airport(7, 4, 20), Airport(8, 5, 30), Airport(9, 7, 30)],),
          ],
        ),
        Text('Gebe die Reihenfolge der Flugplätze an. Eine mögliche Reihenfolge wäre z.B. 5, 6, 1, 8, 3, 9, 2, 4, 7, 5'),
        answer(500),
      ],
    ),
  );
}

Widget Airport (int number, int to, int weight) {
  if(to == 0 && weight == 0) {
    return Container(
      color: secondaryBlue,
      child: Text(number.toString())
    );
  }
  return Container(
    child: Text(number.toString() + "\n->" + to.toString() + '\n' + weight.toString() + 't'),
  );
}