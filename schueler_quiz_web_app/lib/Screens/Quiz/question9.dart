import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget question9(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(100, 0, 100, 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Text('Ein Eurofighter soll ein großes Gebiet überwachen. Um die Flugroute unvorhersehbar zu machen soll die Reichweite in 3 zufällig lange Teilstrecken unterteilt werden.',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          constraints: BoxConstraints(maxWidth: 1000),
        ),
        Text('Wie hoch ist die Wahrscheinlichkeit, dass aus den 3 Teilstrecken ein Dreieck gebildet werden kann und der Eurofighter somit zum Startflugplatz zurückkommt? \nHinweis: Bitte gebe die Lösung als Dezimalzahl an. Ist deine Lösung 50%, dann schreibe 0.5',
          style: Theme.of(context).textTheme.bodyText1,
        )
      ],
    ),
  );
}