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
            child: RichText(
                text: TextSpan(
              style: Theme.of(context).textTheme.bodyText1,
              children: <TextSpan>[
                TextSpan(
                  text: 'In einer Halle sollen',
                ),
                TextSpan(
                    text: '9 Bauplätzen',
                    style: Theme.of(context).textTheme.headline1),
                TextSpan(
                    text:
                        'zur Eurofighter Produktion mit einem Transportband verbunden werden. Das Transportband darf beliebig oft durch jeden Bauplatz und ist beliebig lang, es gibt aber nur 3 Richtungsänderer. Das bedeutet, dass das Transportband schlussendlich aus'),
                TextSpan(
                    text: '4 Geraden',
                    style: Theme.of(context).textTheme.headline1),
                TextSpan(text: 'besteht. Das Transportband muss zu'),
                TextSpan(
                    text: 'Beginn in Station 1',
                    style: Theme.of(context).textTheme.headline1),
                TextSpan(
                    text:
                        'starten muss aber in keiner bestimmten Station enden, gib den Verlauf der vier Bandabschnitte an indem du in chronologischer reihenfolge die Stationen aufschreibst, durch die das Band verläuft (manche Station dürfen 2 oder 3 fach durchlaufen werden).'),
              ],
            )),
          ),
        ),
        Flexible(
            flex: 10,
            child: Container(
                child: Image.asset('assets/images/Nr_X_Ver_4_Weiss.png'))),
        Flexible(
          flex: 1,
          child: Text(
            'Beispiel zum Eingabeformat: "1; 2; 3; 6; 9; 8; 7; 4; 1"',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        )
      ],
    ),
  );
}
