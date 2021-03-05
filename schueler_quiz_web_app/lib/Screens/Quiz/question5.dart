import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget question5(BuildContext context) {
  //Size size = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.fromLTRB(100, 0, 100, 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 2,
          child: Container(
            constraints: BoxConstraints(maxWidth: 1000),
            child: Text('In deinem Paket befinden sich 4 kleine Zettel mit Wörtern und deren Verschlüsselungen. \nErkenne die Verschlüsselungsregel und ordne den Worten ihre Verschlüsselung zu.',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
        Flexible(flex: 5, child: Container(child: Image.asset('assets/images/cyberbodyguards.jpg'))),
        Flexible(
          flex: 1,
          child: Text('Frage: Wie lautet die Verschlüsselung des Wortes "informatik" nach der gleichen Regel?',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        )
      ],
    ),
  );
}