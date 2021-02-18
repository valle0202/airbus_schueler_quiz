import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget question6(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(100, 0, 100, 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: Text('In einer Halle soll ein Transportband mit 9 Bauplätzen in beliebiger Reihenfolge verbunden werden. Das Transportband darf beliebig oft an jedem Bauplatz entlang gehen und ist beliebig lang. Einzige Beschränkung: Alle Transportbänder verlaufen gerade und es gibt nur 4 Richtungsänderer.',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Flexible(flex: 10, child: Container(child: Image.asset('assets/images/Nr_X_Ver_3_Weiss.png'))),
        Flexible(
          flex: 1,
          child: Text('Frage: Signifikante Punkte und so?',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        )
      ],
    ),
  );
}