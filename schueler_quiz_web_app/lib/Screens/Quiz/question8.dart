import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget question8(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(100, 0, 100, 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: Text(
            'The Look and Say Sequence',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Flexible(
            flex: 10,
            child: Container(child: Image.asset('assets/images/Sequence.png'))),
        Flexible(
          flex: 1,
          child: Text(
            'Wie lautet der nächste Eintrag?',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        /*Flexible(
          flex: 1,
          child: Text(
            'Beispiel zum Eingabeformat: "13498798"',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        )*/
      ],
    ),
  );
}
