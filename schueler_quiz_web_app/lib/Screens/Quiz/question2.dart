import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget question2(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(100, 0, 100, 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: Text(
            'Schalter an und aus schalten',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Flexible(
            flex: 10,
            child: Container(
                child: Image.asset('assets/images/Pseudocode_Ver_01.png'))),
        Flexible(
          flex: 1,
          child: Text(
            'Welche boolean sind nach dem Ausführen des Programmes true? Wie lautet der Output?',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Flexible(
          flex: 1,
          child: Text(
            'Beispiel zum Eingabeformat: "99; 4; 101; 2; 17; 3"',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        )
      ],
    ),
  );
}
