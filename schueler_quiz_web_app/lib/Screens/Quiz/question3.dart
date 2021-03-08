import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget question3(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(100, 0, 100, 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: Text(
            'Oh nein! In einer Schublade haben sich 6 Kabel ineinander verhäddert.',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Flexible(
            flex: 10,
            child: Container(
                child: Image.asset('assets/images/Aufgabe_3_Ver_2_Weiss.png'))),
        Flexible(
          flex: 1,
          child: Text(
            'Frage: Welches Kabelende gehört zu dem Kabel, das bei D startet?',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        )
      ],
    ),
  );
}
