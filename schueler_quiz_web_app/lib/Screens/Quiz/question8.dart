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
            child: Container(
                child: Image.asset('assets/images/Aufgabe_3_Ver_1_Weiss.png'))),
        Flexible(
          flex: 1,
          child: Text(
            '1 | 11 | 21 | 1211 | 111221 | 312211 | 12112221 | . . . . . . . . . .',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        )
      ],
    ),
  );
}
