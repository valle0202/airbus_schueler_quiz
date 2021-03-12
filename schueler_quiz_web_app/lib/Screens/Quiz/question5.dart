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
            child: Text(
              'In deinem Paket findest du 10 Zettel mit 5 Wörter und deren Verschlüsselungen. \nErkenne die Verschlüsselungsregel indem du die Wörter ihren Verschlüsselungen zuordnest.',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
        Flexible(
            flex: 7,
            child: Container(
                child: Image.asset('assets/images/cyberbodyguards.jpg'))),
        Flexible(
          flex: 1,
          child: Text(
            'Verschlüssele das Wort "Informatik" nach der selben Regel.',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        /*Flexible(
          flex: 1,
          child: Text('Beispiel zum Eingabeformat: "aslödkfjalskdjf"',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),*/
      ],
    ),
  );
}
