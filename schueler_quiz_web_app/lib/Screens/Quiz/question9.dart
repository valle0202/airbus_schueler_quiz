import 'package:flutter/cupertino.dart';

Widget question9() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(100, 0, 100, 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Ein Eurofighter soll ein großes Gebiet überwachen. Um die Flugroute unvorhersehbar zu machen soll die geplante Flugstrecke in 3 zufällig lange Teilstrecken unterteilt werden.'),
        Text('Wie hoch ist die Wahrscheinlichkeit, dass aus den 3 Teilstrecken ein Dreieck gebildet werden kann und der Eurofighter somit zum Startflugplatz zurückkommt? \n Hinweis: Bitte gebe die Lösung als Dezimalzahl an. Ist deine Lösung 50%, dann schreibe 0.5')
      ],
    ),
  );
}