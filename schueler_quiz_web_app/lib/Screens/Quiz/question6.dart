import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget question6(BuildContext context) {
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
              'In einer Halle soll ein Transportband mit 9 Bauplätzen zur Eurofighter Produktion in beliebiger Reihenfolge verbunden werden. Das Transportband darf beliebig oft an jedem Bauplatz entlang gehen und ist beliebig lang. Einzige Beschränkung: Alle Transportbänder verlaufen gerade und es gibt nur 3 Richtungsänderer.' +
                  'Das Transportband muss zu Beginn in Station 1 starten muss aber in keiner bestimmten Station enden, gib den Verlauf der vier Bandabschnitte an indem du in chronologischer reihenfolge die Stationen aufschreibst, du die das Band verläuft (manche Station dürfen 2 oder 3 fach durchlaufen werden).',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
        Flexible(
            flex: 10,
            child: Container(
                child: Image.asset('assets/images/Nr_X_Ver_4_Weiss.png'))),
        Flexible(
          flex: 1,
          child: Text(
            'Eingabebeispiel "1; 2; 3; 6; 9; 8; 7; 4; 1" (dieses Band würde nur die äußeren Stationen ablaufen und wäre daher keine valide Antwort)',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        )
      ],
    ),
  );
}
